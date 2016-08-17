require "text_cleaner/version"

module TextCleaner
  DICTIONARY = <<-EOS
  quotation mark 	&quot;  	&#34;  	&#x22;  	"  	"  	"
  ampersand 	&amp; 	&#38; 	&#x26; 	& 	& 	&
  less-than sign 	&lt; 	&#60; 	&#x3C; 	< 	< 	<
  greater-than sign 	&gt; 	&#62; 	&#x3E; 	> 	> 	>
  Latin capital ligature OE 	&OElig; 	&#338; 	&#x152; 	Œ 	Œ 	Œ
  Latin small ligature oe 	&oelig; 	&#339; 	&#x153; 	œ 	œ 	œ
  Latin capital letter S with caron 	&Scaron; 	&#352; 	&#x160; 	Š 	Š 	Š
  Latin small letter s with caron 	&scaron; 	&#353; 	&#x161; 	š 	š 	š
  Latin capital letter Y with diaeresis 	&Yuml; 	&#376; 	&#x178; 	Ÿ 	Ÿ 	Ÿ
  modifier letter circumflex accent 	&circ; 	&#710; 	&#x2C6; 	ˆ 	ˆ 	ˆ
  small tilde 	&tilde; 	&#732; 	&#x2DC; 	˜ 	˜ 	˜
  en space 	&ensp; 	&#8194; 	&#x2002; 	  	  	 
  em space 	&emsp; 	&#8195; 	&#x2003; 	  	  	 
  thin space 	&thinsp; 	&#8201; 	&#x2009; 	  	  	 
  zero width non-joiner 	&zwnj; 	&#8204; 	&#x200C; 	‌ 	‌ 	‌
  zero width joiner 	&zwj; 	&#8205; 	&#x200D; 	‍ 	‍ 	‍
  left-to-right mark 	&lrm; 	&#8206; 	&#x200E; 	‎ 	‎ 	‎
  right-to-left mark 	&rlm; 	&#8207; 	&#x200F; 	‏ 	‏ 	‏
  en dash 	&ndash; 	&#8211; 	&#x2013; 	– 	– 	–
  em dash 	&mdash; 	&#8212; 	&#x2014; 	— 	— 	—
  amster right single quotation mark 	&rsquo; 	&#8217; 	&#x2019; 	’ 	’ 	’
  left single quotation mark 	&lsquo; 	&#8216; 	&#x2018; 	‘ 	‘ 	‘
  right single quotation mark 	&rsquo; 	&#8217; 	&#x2019; 	’ 	’ 	’
  single low-9 quotation mark 	&sbquo; 	&#8218; 	&#x201A; 	‚ 	‚ 	‚
  left double quotation mark 	&ldquo; 	&#8220; 	&#x201C; 	“ 	“ 	“
  right double quotation mark 	&rdquo; 	&#8221; 	&#x201D; 	” 	” 	”
  double low-9 quotation mark 	&bdquo; 	&#8222; 	&#x201E; 	„ 	„ 	„
  dagger 	&dagger; 	&#8224; 	&#x2020; 	† 	† 	†
  double dagger 	&Dagger; 	&#8225; 	&#x2021; 	‡ 	‡ 	‡
  per mille sign 	&permil; 	&#8240; 	&#x2030; 	‰ 	‰ 	‰
  single left-pointing angle quotation mark 	&lsaquo; 	&#8249; 	&#x2039; 	‹ 	‹ 	‹
  single right-pointing angle quotation mark 	&rsaquo; 	&#8250; 	&#x203A; 	› 	› 	›
  euro sign 	&euro; 	&#8364; 	&#x20AC; 	€ 	€ 	€
  Latin small f with hook = function = florin  	&fnof;  	&#402;  	&#x192;  	ƒ  	ƒ  	ƒ
  Greek capital letter alpha 	&Alpha; 	&#913; 	&#x391; 	Α 	Α 	Α
  Greek capital letter beta 	&Beta; 	&#914; 	&#x392; 	Β 	Β 	Β
  Greek capital letter gamma 	&Gamma; 	&#915; 	&#x393; 	Γ 	Γ 	Γ
  Greek capital letter delta 	&Delta; 	&#916; 	&#x394; 	Δ 	Δ 	Δ
  Greek capital letter epsilon 	&Epsilon; 	&#917; 	&#x395; 	Ε 	Ε 	Ε
  Greek capital letter zeta 	&Zeta; 	&#918; 	&#x396; 	Ζ 	Ζ 	Ζ
  Greek capital letter eta 	&Eta; 	&#919; 	&#x397; 	Η 	Η 	Η
  Greek capital letter theta 	&Theta; 	&#920; 	&#x398; 	Θ 	Θ 	Θ
  Greek capital letter iota 	&Iota; 	&#921; 	&#x399; 	Ι 	Ι 	Ι
  Greek capital letter kappa 	&Kappa; 	&#922; 	&#x39A; 	Κ 	Κ 	Κ
  Greek capital letter lambda 	&Lambda; 	&#923; 	&#x39B; 	Λ 	Λ 	Λ
  Greek capital letter mu 	&Mu; 	&#924; 	&#x39C; 	Μ 	Μ 	Μ
  Greek capital letter nu 	&Nu; 	&#925; 	&#x39D; 	Ν 	Ν 	Ν
  Greek capital letter xi 	&Xi; 	&#926; 	&#x39E; 	Ξ 	Ξ 	Ξ
  Greek capital letter omicron 	&Omicron; 	&#927; 	&#x39F; 	Ο 	Ο 	Ο
  Greek capital letter pi 	&Pi; 	&#928; 	&#x3A0; 	Π 	Π 	Π
  Greek capital letter rho 	&Rho; 	&#929; 	&#x3A1; 	Ρ 	Ρ 	Ρ
  Greek capital letter sigma 	&Sigma; 	&#931; 	&#x3A3; 	Σ 	Σ 	Σ
  Greek capital letter tau 	&Tau; 	&#932; 	&#x3A4; 	Τ 	Τ 	Τ
  Greek capital letter upsilon 	&Upsilon; 	&#933; 	&#x3A5; 	Υ 	Υ 	Υ
  Greek capital letter phi 	&Phi; 	&#934; 	&#x3A6; 	Φ 	Φ 	Φ
  Greek capital letter chi 	&Chi; 	&#935; 	&#x3A7; 	Χ 	Χ 	Χ
  Greek capital letter psi 	&Psi; 	&#936; 	&#x3A8; 	Ψ 	Ψ 	Ψ
  Greek capital letter omega 	&Omega; 	&#937; 	&#x3A9; 	Ω 	Ω 	Ω
  Greek small letter alpha 	&alpha; 	&#945; 	&#x3B1; 	α 	α 	α
  Greek small letter beta 	&beta; 	&#946; 	&#x3B2; 	β 	β 	β
  Greek small letter gamma 	&gamma; 	&#947; 	&#x3B3; 	γ 	γ 	γ
  Greek small letter delta 	&delta; 	&#948; 	&#x3B4; 	δ 	δ 	δ
  Greek small letter epsilon 	&epsilon; 	&#949; 	&#x3B5; 	ε 	ε 	ε
  Greek small letter zeta 	&zeta; 	&#950; 	&#x3B6; 	ζ 	ζ 	ζ
  Greek small letter eta 	&eta; 	&#951; 	&#x3B7; 	η 	η 	η
  Greek small letter theta 	&theta; 	&#952; 	&#x3B8; 	θ 	θ 	θ
  Greek small letter iota 	&iota; 	&#953; 	&#x3B9; 	ι 	ι 	ι
  Greek small letter kappa 	&kappa; 	&#954; 	&#x3BA; 	κ 	κ 	κ
  Greek small letter lambda 	&lambda; 	&#955; 	&#x3BB; 	λ 	λ 	λ
  Greek small letter mu 	&mu; 	&#956; 	&#x3BC; 	μ 	μ 	μ
  Greek small letter nu 	&nu; 	&#957; 	&#x3BD; 	ν 	ν 	ν
  Greek small letter xi 	&xi; 	&#958; 	&#x3BE; 	ξ 	ξ 	ξ
  Greek small letter omicron 	&omicron; 	&#959; 	&#x3BF; 	ο 	ο 	ο
  Greek small letter pi 	&pi; 	&#960; 	&#x3C0; 	π 	π 	π
  Greek small letter rho 	&rho; 	&#961; 	&#x3C1; 	ρ 	ρ 	ρ
  Greek small letter final sigma 	&sigmaf; 	&#962; 	&#x3C2; 	ς 	ς 	ς
  Greek small letter sigma 	&sigma; 	&#963; 	&#x3C3; 	σ 	σ 	σ
  Greek small letter tau 	&tau; 	&#964; 	&#x3C4; 	τ 	τ 	τ
  Greek small letter upsilon 	&upsilon; 	&#965; 	&#x3C5; 	υ 	υ 	υ
  Greek small letter phi 	&phi; 	&#966; 	&#x3C6; 	φ 	φ 	φ
  Greek small letter chi 	&chi; 	&#967; 	&#x3C7; 	χ 	χ 	χ
  Greek small letter psi 	&psi; 	&#968; 	&#x3C8; 	ψ 	ψ 	ψ
  Greek small letter omega 	&omega; 	&#969; 	&#x3C9; 	ω 	ω 	ω
  Greek small letter theta symbol 	&thetasym; 	&#977; 	&#x3D1; 	ϑ 	ϑ 	ϑ
  Greek upsilon with hook symbol 	&upsih; 	&#978; 	&#x3D2; 	ϒ 	ϒ 	ϒ
  Greek pi symbol 	&piv; 	&#982; 	&#x3D6; 	ϖ 	ϖ 	ϖ
  bullet = black small circle 	&bull; 	&#8226; 	&#x2022; 	• 	• 	•
  horizontal ellipsis = three dot leader 	&hellip; 	&#8230; 	&#x2026; 	… 	… 	…
  prime = minutes = feet 	&prime; 	&#8242; 	&#x2032; 	′ 	′ 	′
  double prime = seconds = inches 	&Prime; 	&#8243; 	&#x2033; 	″ 	″ 	″
  overline = spacing overscore 	&oline; 	&#8254; 	&#x203E; 	‾ 	‾ 	‾
  fraction slash 	&frasl; 	&#8260; 	&#x2044; 	⁄ 	⁄ 	⁄
  script capital P = power set = Weierstrass p 	&weierp; 	&#8472; 	&#x2118; 	℘ 	℘ 	℘
  blackletter capital I = imaginary part 	&image; 	&#8465; 	&#x2111; 	ℑ 	ℑ 	ℑ
  blackletter capital R = real part symbol 	&real; 	&#8476; 	&#x211C; 	ℜ 	ℜ 	ℜ
  trade mark sign 	&trade; 	&#8482; 	&#x2122; 	™ 	™ 	™
  alef symbol = first transfinite cardinal 	&alefsym; 	&#8501; 	&#x2135; 	ℵ 	ℵ 	ℵ
  leftwards arrow 	&larr; 	&#8592; 	&#x2190; 	← 	← 	←
  upwards arrow 	&uarr; 	&#8593; 	&#x2191; 	↑ 	↑ 	↑
  rightwards arrow 	&rarr; 	&#8594; 	&#x2192; 	→ 	→ 	→
  downwards arrow 	&darr; 	&#8595; 	&#x2193; 	↓ 	↓ 	↓
  left right arrow 	&harr; 	&#8596; 	&#x2194; 	↔ 	↔ 	↔
  downwards arrow with corner leftwards = carriage return 	&crarr; 	&#8629; 	&#x21B5; 	↵ 	↵ 	↵
  leftwards double arrow 	&lArr; 	&#8656; 	&#x21D0; 	⇐ 	⇐ 	⇐
  upwards double arrow 	&uArr; 	&#8657; 	&#x21D1; 	⇑ 	⇑ 	⇑
  rightwards double arrow 	&rArr; 	&#8658; 	&#x21D2; 	⇒ 	⇒ 	⇒
  downwards double arrow 	&dArr; 	&#8659; 	&#x21D3; 	⇓ 	⇓ 	⇓
  left right double arrow 	&hArr; 	&#8660; 	&#x21D4; 	⇔ 	⇔ 	⇔
  for all 	&forall; 	&#8704; 	&#x2200; 	∀ 	∀ 	∀
  partial differential 	&part; 	&#8706; 	&#x2202; 	∂ 	∂ 	∂
  there exists 	&exist; 	&#8707; 	&#x2203; 	∃ 	∃ 	∃
  empty set = null set = diameter 	&empty; 	&#8709; 	&#x2205; 	∅ 	∅ 	∅
  nabla = backward difference 	&nabla; 	&#8711; 	&#x2207; 	∇ 	∇ 	∇
  element of 	&isin; 	&#8712; 	&#x2208; 	∈ 	∈ 	∈
  not an element of 	&notin; 	&#8713; 	&#x2209; 	∉ 	∉ 	∉
  contains as member 	&ni; 	&#8715; 	&#x220B; 	∋ 	∋ 	∋
  n-ary product = product sign 	&prod; 	&#8719; 	&#x220F; 	∏ 	∏ 	∏
  n-ary sumation 	&sum; 	&#8721; 	&#x2211; 	∑ 	∑ 	∑
  minus sign 	&minus; 	&#8722; 	&#x2212; 	− 	− 	−
  asterisk operator 	&lowast; 	&#8727; 	&#x2217; 	∗ 	∗ 	∗
  square root = radical sign 	&radic; 	&#8730; 	&#x221A; 	√ 	√ 	√
  proportional to 	&prop; 	&#8733; 	&#x221D; 	∝ 	∝ 	∝
  infinity 	&infin; 	&#8734; 	&#x221E; 	∞ 	∞ 	∞
  angle 	&ang; 	&#8736; 	&#x2220; 	∠ 	∠ 	∠
  logical and = wedge 	&and; 	&#8743; 	&#x2227; 	∧ 	∧ 	∧
  logical or = vee 	&or; 	&#8744; 	&#x2228; 	∨ 	∨ 	∨
  intersection = cap 	&cap; 	&#8745; 	&#x2229; 	∩ 	∩ 	∩
  union = cup 	&cup; 	&#8746; 	&#x222A; 	∪ 	∪ 	∪
  integral 	&int; 	&#8747; 	&#x222B; 	∫ 	∫ 	∫
  therefore 	&there4; 	&#8756; 	&#x2234; 	∴ 	∴ 	∴
  tilde operator = varies with = similar to 	&sim; 	&#8764; 	&#x223C; 	∼ 	∼ 	∼
  approximately equal to 	&cong; 	&#8773; 	&#x2245; 	≅ 	≅ 	≅
  almost equal to = asymptotic to 	&asymp; 	&#8776; 	&#x2248; 	≈ 	≈ 	≈
  not equal to 	&ne; 	&#8800; 	&#x2260; 	≠ 	≠ 	≠
  identical to 	&equiv; 	&#8801; 	&#x2261; 	≡ 	≡ 	≡
  less-than or equal to 	&le; 	&#8804; 	&#x2264; 	≤ 	≤ 	≤
  greater-than or equal to 	&ge; 	&#8805; 	&#x2265; 	≥ 	≥ 	≥
  subset of 	&sub; 	&#8834; 	&#x2282; 	⊂ 	⊂ 	⊂
  superset of 	&sup; 	&#8835; 	&#x2283; 	⊃ 	⊃ 	⊃
  not a subset of 	&nsub; 	&#8836; 	&#x2284; 	⊄ 	⊄ 	⊄
  subset of or equal to 	&sube; 	&#8838; 	&#x2286; 	⊆ 	⊆ 	⊆
  superset of or equal to 	&supe; 	&#8839; 	&#x2287; 	⊇ 	⊇ 	⊇
  circled plus = direct sum 	&oplus; 	&#8853; 	&#x2295; 	⊕ 	⊕ 	⊕
  circled times = vector product 	&otimes; 	&#8855; 	&#x2297; 	⊗ 	⊗ 	⊗
  up tack = orthogonal to = perpendicular 	&perp; 	&#8869; 	&#x22A5; 	⊥ 	⊥ 	⊥
  dot operator 	&sdot; 	&#8901; 	&#x22C5; 	⋅ 	⋅ 	⋅
  left ceiling = APL upstile 	&lceil; 	&#8968; 	&#x2308; 	⌈ 	⌈ 	⌈
  right ceiling 	&rceil; 	&#8969; 	&#x2309; 	⌉ 	⌉ 	⌉
  left floor = APL downstile 	&lfloor; 	&#8970; 	&#x230A; 	⌊ 	⌊ 	⌊
  right floor 	&rfloor; 	&#8971; 	&#x230B; 	⌋ 	⌋ 	⌋
  left-pointing angle bracket = bra 	&lang; 	&#9001; 	&#x2329; 	〈 	〈 	〈
  right-pointing angle bracket = ket 	&rang; 	&#9002; 	&#x232A; 	〉 	〉 	〉
  lozenge 	&loz; 	&#9674; 	&#x25CA; 	◊ 	◊ 	◊
  black spade suit 	&spades; 	&#9824; 	&#x2660; 	♠ 	♠ 	♠
  black club suit = shamrock 	&clubs; 	&#9827; 	&#x2663; 	♣ 	♣ 	♣
  black heart suit = valentine 	&hearts; 	&#9829; 	&#x2665; 	♥ 	♥ 	♥
  black diamond suit 	&diams; 	&#9830; 	&#x2666; 	♦ 	♦ 	♦
  inverted exclamation mark 	&iexcl; 	&#161; 	&#xA1; 	¡ 	¡ 	¡
  cent sign 	&cent; 	&#162; 	&#xA2; 	¢ 	¢ 	¢
  pound sign 	&pound; 	&#163; 	&#xA3; 	£ 	£ 	£
  currency sign 	&curren; 	&#164; 	&#xA4; 	¤ 	¤ 	¤
  yen sign = yuan sign 	&yen; 	&#165; 	&#xA5; 	¥ 	¥ 	¥
  broken bar = broken vertical bar 	&brvbar; 	&#166; 	&#xA6; 	¦ 	¦ 	¦
  section sign 	&sect; 	&#167; 	&#xA7; 	§ 	§ 	§
  diaeresis = spacing diaeresis 	&uml; 	&#168; 	&#xA8; 	¨ 	¨ 	¨
  copyright sign 	&copy; 	&#169; 	&#xA9; 	© 	© 	©
  feminine ordinal indicator 	&ordf; 	&#170; 	&#xAA; 	ª 	ª 	ª
  left-pointing double angle quotation mark = left pointing guillemet 	&laquo; 	&#171; 	&#xAB; 	« 	« 	«
  not sign 	&not; 	&#172; 	&#xAC; 	¬ 	¬ 	¬
  soft hyphen = discretionary hyphen 	&shy; 	&#173; 	&#xAD; 	­ 	­ 	­
  registered sign = registered trade mark sign 	&reg; 	&#174; 	&#xAE; 	® 	® 	®
  macron = spacing macron = overline = APL overbar 	&macr; 	&#175; 	&#xAF; 	¯ 	¯ 	¯
  degree sign 	&deg; 	&#176; 	&#xB0; 	° 	° 	°
  plus-minus sign = plus-or-minus sign 	&plusmn; 	&#177; 	&#xB1; 	± 	± 	±
  superscript two = superscript digit two = squared 	&sup2; 	&#178; 	&#xB2; 	² 	² 	²
  superscript three = superscript digit three = cubed 	&sup3; 	&#179; 	&#xB3; 	³ 	³ 	³
  acute accent = spacing acute 	&acute; 	&#180; 	&#xB4; 	´ 	´ 	´
  micro sign 	&micro; 	&#181; 	&#xB5; 	µ 	µ 	µ
  pilcrow sign = paragraph sign 	&para; 	&#182; 	&#xB6; 	¶ 	¶ 	¶
  middle dot = Georgian comma = Greek middle dot 	&middot; 	&#183; 	&#xB7; 	· 	· 	·
  cedilla = spacing cedilla 	&cedil; 	&#184; 	&#xB8; 	¸ 	¸ 	¸
  superscript one = superscript digit one 	&sup1; 	&#185; 	&#xB9; 	¹ 	¹ 	¹
  masculine ordinal indicator 	&ordm; 	&#186; 	&#xBA; 	º 	º 	º
  right-pointing double angle quotation mark = right pointing guillemet 	&raquo; 	&#187; 	&#xBB; 	» 	» 	»
  vulgar fraction one quarter = fraction one quarter 	&frac14; 	&#188; 	&#xBC; 	¼ 	¼ 	¼
  vulgar fraction one half = fraction one half 	&frac12; 	&#189; 	&#xBD; 	½ 	½ 	½
  vulgar fraction three quarters = fraction three quarters 	&frac34; 	&#190; 	&#xBE; 	¾ 	¾ 	¾
  inverted question mark = turned question mark 	&iquest; 	&#191; 	&#xBF; 	¿ 	¿ 	¿
  Latin capital letter A with grave = Latin capital letter A grave 	&Agrave; 	&#192; 	&#xC0; 	À 	À 	À
  Latin capital letter A with acute 	&Aacute; 	&#193; 	&#xC1; 	Á 	Á 	Á
  Latin capital letter A with circumflex 	&Acirc; 	&#194; 	&#xC2; 	Â 	Â 	Â
  Latin capital letter A with tilde 	&Atilde; 	&#195; 	&#xC3; 	Ã 	Ã 	Ã
  Latin capital letter A with diaeresis 	&Auml; 	&#196; 	&#xC4; 	Ä 	Ä 	Ä
  Latin capital letter A with ring above = Latin capital letter A ring 	&Aring; 	&#197; 	&#xC5; 	Å 	Å 	Å
  Latin capital letter AE = Latin capital ligature AE 	&AElig; 	&#198; 	&#xC6; 	Æ 	Æ 	Æ
  Latin capital letter C with cedilla 	&Ccedil; 	&#199; 	&#xC7; 	Ç 	Ç 	Ç
  Latin capital letter E with grave 	&Egrave; 	&#200; 	&#xC8; 	È 	È 	È
  Latin capital letter E with acute 	&Eacute; 	&#201; 	&#xC9; 	É 	É 	É
  Latin capital letter E with circumflex 	&Ecirc; 	&#202; 	&#xCA; 	Ê 	Ê 	Ê
  Latin capital letter E with diaeresis 	&Euml; 	&#203; 	&#xCB; 	Ë 	Ë 	Ë
  Latin capital letter I with grave 	&Igrave; 	&#204; 	&#xCC; 	Ì 	Ì 	Ì
  Latin capital letter I with acute 	&Iacute; 	&#205; 	&#xCD; 	Í 	Í 	Í
  Latin capital letter I with circumflex 	&Icirc; 	&#206; 	&#xCE; 	Î 	Î 	Î
  Latin capital letter I with diaeresis 	&Iuml; 	&#207; 	&#xCF; 	Ï 	Ï 	Ï
  Latin capital letter ETH 	&ETH; 	&#208; 	&#xD0; 	Ð 	Ð 	Ð
  Latin capital letter N with tilde 	&Ntilde; 	&#209; 	&#xD1; 	Ñ 	Ñ 	Ñ
  Latin capital letter O with grave 	&Ograve; 	&#210; 	&#xD2; 	Ò 	Ò 	Ò
  Latin capital letter O with acute 	&Oacute; 	&#211; 	&#xD3; 	Ó 	Ó 	Ó
  Latin capital letter O with circumflex 	&Ocirc; 	&#212; 	&#xD4; 	Ô 	Ô 	Ô
  Latin capital letter O with tilde 	&Otilde; 	&#213; 	&#xD5; 	Õ 	Õ 	Õ
  Latin capital letter O with diaeresis 	&Ouml; 	&#214; 	&#xD6; 	Ö 	Ö 	Ö
  multiplication sign 	&times; 	&#215; 	&#xD7; 	× 	× 	×
  Latin capital letter O with stroke = Latin capital letter O slash 	&Oslash; 	&#216; 	&#xD8; 	Ø 	Ø 	Ø
  Latin capital letter U with grave 	&Ugrave; 	&#217; 	&#xD9; 	Ù 	Ù 	Ù
  Latin capital letter U with acute 	&Uacute; 	&#218; 	&#xDA; 	Ú 	Ú 	Ú
  Latin capital letter U with circumflex 	&Ucirc; 	&#219; 	&#xDB; 	Û 	Û 	Û
  Latin capital letter U with diaeresis 	&Uuml; 	&#220; 	&#xDC; 	Ü 	Ü 	Ü
  Latin capital letter Y with acute 	&Yacute; 	&#221; 	&#xDD; 	Ý 	Ý 	Ý
  Latin capital letter THORN 	&THORN; 	&#222; 	&#xDE; 	Þ 	Þ 	Þ
  Latin small letter sharp s = ess-zed 	&szlig; 	&#223; 	&#xDF; 	ß 	ß 	ß
  Latin small letter a with grave = Latin small letter a grave 	&agrave; 	&#224; 	&#xE0; 	à 	à 	à
  Latin small letter a with acute 	&aacute; 	&#225; 	&#xE1; 	á 	á 	á
  Latin small letter a with circumflex 	&acirc; 	&#226; 	&#xE2; 	â 	â 	â
  Latin small letter a with tilde 	&atilde; 	&#227; 	&#xE3; 	ã 	ã 	ã
  Latin small letter a with diaeresis 	&auml; 	&#228; 	&#xE4; 	ä 	ä 	ä
  Latin small letter a with ring above = Latin small letter a ring 	&aring; 	&#229; 	&#xE5; 	å 	å 	å
  Latin small letter ae = Latin small ligature ae 	&aelig; 	&#230; 	&#xE6; 	æ 	æ 	æ
  Latin small letter c with cedilla 	&ccedil; 	&#231; 	&#xE7; 	ç 	ç 	ç
  Latin small letter e with grave 	&egrave; 	&#232; 	&#xE8; 	è 	è 	è
  Latin small letter e with acute 	&eacute; 	&#233; 	&#xE9; 	é 	é 	é
  Latin small letter e with circumflex 	&ecirc; 	&#234; 	&#xEA; 	ê 	ê 	ê
  Latin small letter e with diaeresis 	&euml; 	&#235; 	&#xEB; 	ë 	ë 	ë
  Latin small letter i with grave 	&igrave; 	&#236; 	&#xEC; 	ì 	ì 	ì
  Latin small letter i with acute 	&iacute; 	&#237; 	&#xED; 	í 	í 	í
  Latin small letter i with circumflex 	&icirc; 	&#238; 	&#xEE; 	î 	î 	î
  Latin small letter i with diaeresis 	&iuml; 	&#239; 	&#xEF; 	ï 	ï 	ï
  Latin small letter eth 	&eth; 	&#240; 	&#xF0; 	ð 	ð 	ð
  Latin small letter n with tilde 	&ntilde; 	&#241; 	&#xF1; 	ñ 	ñ 	ñ
  Latin small letter o with grave 	&ograve; 	&#242; 	&#xF2; 	ò 	ò 	ò
  Latin small letter o with acute 	&oacute; 	&#243; 	&#xF3; 	ó 	ó 	ó
  Latin small letter o with circumflex 	&ocirc; 	&#244; 	&#xF4; 	ô 	ô 	ô
  Latin small letter o with tilde 	&otilde; 	&#245; 	&#xF5; 	õ 	õ 	õ
  Latin small letter o with diaeresis 	&ouml; 	&#246; 	&#xF6; 	ö 	ö 	ö
  division sign 	&divide; 	&#247; 	&#xF7; 	÷ 	÷ 	÷
  Latin small letter o with stroke = Latin small letter o slash 	&oslash; 	&#248; 	&#xF8; 	ø 	ø 	ø
  Latin small letter u with grave 	&ugrave; 	&#249; 	&#xF9; 	ù 	ù 	ù
  Latin small letter u with acute 	&uacute; 	&#250; 	&#xFA; 	ú 	ú 	ú
  Latin small letter u with circumflex 	&ucirc; 	&#251; 	&#xFB; 	û 	û 	û
  Latin small letter u with diaeresis 	&uuml; 	&#252; 	&#xFC; 	ü 	ü 	ü
  Latin small letter y with acute 	&yacute; 	&#253; 	&#xFD; 	ý 	ý 	ý
  Latin small letter thorn 	&thorn; 	&#254; 	&#xFE; 	þ 	þ 	þ
  Latin small letter y with diaeresis 	&yuml; 	&#255; 	&#xFF; 	ÿ 	ÿ 	ÿ
  EOS


  
  def self.clean(input_text)
    DICTIONARY.each_line do |line|
      name, html, hex, oct, display, display2, display3 = line.split(/\t/)
      input_text.gsub!(display.strip, html.strip)
    end
    input_text
  end

  def self.only(input_text, char)
    DICTIONARY.each_line do |line|
      name, html, hex, oct, display, display2, display3 = line.split(/\t/)
      if display.include?(char)
        input_text.gsub!(display.strip, html.strip)
      end
    end
    input_text
  end
end
