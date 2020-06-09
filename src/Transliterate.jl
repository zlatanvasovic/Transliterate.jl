module Transliterate

export transliterate, replacements

include("replacements.jl")

wrap_language(language::AbstractString) = [language]
wrap_language(language::Nothing) = first.(replacements)
wrap_language(language::AbstractVector) = language

"""
    transliterate(str; language=nothing, custom_replacements=Dict())

Converts non-ASCII characters into ASCII using [transliteration](https://en.wikipedia.org/wiki/Transliteration).

# Examples
```julia-repl
julia> transliterate("Déjà Vu!")
"Deja Vu!"
julia> transliterate("Привет")
"Privet"
julia> transliterate("ث س و"; language="ar")
"th s w"
julia> transliterate("≠ ∉"; custom_replacements=Dict("≠" => "not equal", "∉" => "not in"))
"not equal not in"
```
"""
transliterate(str; language=nothing, custom_replacements=Dict()) =
    transliterate(str, wrap_language(language), custom_replacements)

function transliterate(str, language, custom_replacements)
    str = foldl(replace, custom_replacements, init = str)

    if "la" ∉ language
        str = foldl(replace, replacements[1].second, init = str)
    end

    for language ∈ language
        # TODO: Add warning if a specified language is missing
        lang_id = findfirst(x -> x.first == language, replacements)
        d = replacements[lang_id].second
        str = foldl(replace, d, init = str)
    end

    return str
end

end # module
