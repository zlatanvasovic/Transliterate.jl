module Transliterate

export transliterate

include("replacements.jl")
"All languages defined in (`replacements`)[@ref]."
const languages = first.(replacements)

"""
    transliterate(str; languages=languages, custom_replacements=())

Converts non-ASCII characters into ASCII using [transliteration](https://en.wikipedia.org/wiki/Transliteration).

# Examples
```julia-repl
julia> transliterate("Déjà Vu!")
"Deja Vu!"

julia> transliterate("Привет")
"Privet"

julia> transliterate("ث س و"; languages=["ar"])
"th s w"

julia> transliterate("≠ ∉"; custom_replacements=("≠" => "not equal", "∉" => "not in"))
"not equal not in"
```
"""
function transliterate(str; languages=languages, custom_replacements=())
    str = foldl(replace, custom_replacements, init = str)

    if "la" ∉ languages
        str = foldl(replace, replacements[1].second, init = str)
    end
    for language ∈ languages
        language_id = findfirst(x -> x.first == language, replacements)
        d = replacements[language_id].second
        str = foldl(replace, d, init = str)
    end

    return str
end

end # module
