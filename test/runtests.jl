using Transliterate
using Test

@testset "transliterate" begin
    @test transliterate("абвгдђежзијклљмнњопрстћуфхцчџш") == "abvgddjezhzijklljmnnjoprstcufhczchdzsh"
    @test transliterate("Привет") == "Privet"
    @test transliterate("Foo ÿ") == "Foo y"
	@test transliterate("Hællæ, hva skjera?") == "Haellae, hva skjera?"
    @test transliterate("Déjà Vu!") == "Deja Vu!"

    @test transliterate("ث س و"; language="ar") == "th s w"
    @test transliterate("ћ ћ ћ ჰ"; language=["sr", "ka"]) == "c c c h"

    custom_replacements = Dict("≠" => "not equal", "∉" => "not in")
    custom_replacements_copy = deepcopy(custom_replacements)
    @test transliterate("≠ ∉"; custom_replacements=custom_replacements) == "not equal not in"
    @test custom_replacements == custom_replacements_copy
end
