using Transliterate
using Test

@testset "transliterate" begin
    @test transliterate("абвгдђежзијклљмнњопрстћуфхцчџш") == "abvgddjezhzijklljmnnjoprstcufhcchdzsh"
    @test transliterate("Привет") == "Privet"
    @test transliterate("Foo ÿ") == "Foo y"
	@test transliterate("Hællæ, hva skjera?") == "Haellae, hva skjera?"
    @test transliterate("Déjà Vu!") == "Deja Vu!"

    @test transliterate("ث س و"; languages="ar") == "th s w"

    @test transliterate("≠ ∉"; custom_replacements=Dict("≠" => "not equal", "∉" => "not in")) == "not equal not in"
end
