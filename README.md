# Transliterate

[![Build Status](https://github.com/zdroid/Transliterate.jl/workflows/CI/badge.svg)](https://github.com/zdroid/Transliterate.jl/actions)
[![Coverage](https://codecov.io/gh/zdroid/Transliterate.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/zdroid/Transliterate.jl)

Converts non-ASCII characters into ASCII using [transliteration](https://en.wikipedia.org/wiki/Transliteration).

## Install

```julia
]add Transliterate
```

## Examples

```julia
julia> using Transliterate

julia> transliterate("Déjà Vu!")
"Deja Vu!"

julia> transliterate("Привет")
"Privet"

julia> transliterate("ث س و"; language="ar")
"th s w"

julia> custom_replacements = Dict("≠" => "not equal", "∉" => "not in")
julia> transliterate("≠ ∉"; custom_replacements=custom_replacements)
"not equal not in"
```

## Todo

- Add all rules for every language, instead of the current approach
  - This will allow proper `language="language"` syntax
- Support more languages

Contributions are welcome.
