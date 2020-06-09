module Transliterate

export transliterate, replacements

include("replacements.jl")

wrap_languages(languages::AbstractString) = [languages]
wrap_languages(languages::Nothing) = first.(replacements)
wrap_languages(languages) = isempty(languages) ? wrap_languages(nothing) : languages

"""
    transliterate(str; languages=[], custom_replacements=Dict())

Converts non-ASCII characters into ASCII using [transliteration](https://en.wikipedia.org/wiki/Transliteration).

# Examples
```julia-repl
julia> transliterate("Déjà Vu!")
"Deja Vu!"
julia> transliterate("Привет")
"Privet"
julia> transliterate("ث س و"; languages="ar")
"th s w"
julia> transliterate("≠ ∉"; custom_replacements=Dict("≠" => "not equal", "∉" => "not in"))
"not equal not in"
```
"""
transliterate(str; languages = nothing, custom_replacements = Dict()) = transliterate(str, wrap_languages(languages); custom_replacements = custom_replacements)

function transliterate(str, languages; custom_replacements = Dict())
    str = foldl(replace, custom_replacements, init = str)

    if "la" ∉ languages
        str = foldl(replace, replacements[1].second, init = str)
    end

    for language in languages
        # TODO: Add warning if a specified language is missing
        lang_id = findfirst(x -> x.first == language, replacements)
        d = replacements[lang_id].second
        str = foldl(replace, d, init = str)
    end

    return str
end

end # module
