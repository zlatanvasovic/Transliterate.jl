module Transliterate

export transliterate, replacements

include("replacements.jl")

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
function transliterate(str; languages=[], custom_replacements=Dict())
    if languages ≠ []
        if typeof(languages) == String
            languages = [languages]
        end

        if "la" ∉ languages
            pushfirst!(languages, "la")
        end

        for language in languages
            merge!(custom_replacements, replacements[language])
        end
    else
        for replacement in replacements
            merge!(custom_replacements, replacement.second)
        end
    end

    for pair in custom_replacements
        str = replace(str, pair.first => pair.second)
    end
    return str
end

end # module