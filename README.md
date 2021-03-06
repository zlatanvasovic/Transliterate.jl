# Transliterate

[![Build Status](https://github.com/zlatanvasovic/Transliterate.jl/workflows/CI/badge.svg)](https://github.com/zlatanvasovic/Transliterate.jl/actions)
[![Coverage](https://codecov.io/gh/zlatanvasovic/Transliterate.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/zlatanvasovic/Transliterate.jl)

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

julia> transliterate("ث س و"; languages=["ar"])
"th s w"

julia> transliterate("≠ ∉"; custom_replacements=("≠" => "not equal", "∉" => "not in"))
"not equal not in"
```

## Todo

- Add all rules for every language, instead of the current approach
  - This would allow proper `languages` syntax
- Support more languages

Contributions are welcome.
