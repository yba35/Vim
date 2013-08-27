"syntax keyword Status_Ok Ok
"highlight default link Status_Ok Identifier
"
"syntax keyword Status_Error Failed Error
"highlight default link Status_Error Error
"
syn match	vxtComment	"^#.*"
syn match	vxtComment	"\s#.*"ms=s+1
hi def link vxtComment	Comment


syntax region VxtFile start="betacrypt" end="\.vxt"
highlight default link VxtFile Underlined

syn region	vxtTitle1	start="^.*T1.*" end="----$"
hi def link vxtTitle1	Title

syn region	vxtTitle2	start="^.*T2.*" end="----$"
hi def link vxtTitle2	Identifier

syn region	vxtTitle3	start="^.*T3.*" end="$"
hi def link vxtTitle3	Special

syn region	vxtPerso	start="^#.*file" end="^.*perso.*$" fold
syn region	vxtPIMLoad  start="^#.*Command.*PIM.*" end="^Time.*ms$" fold
syn region	vxtECMBuild start="^#.*Build ECM.*" end="^Time.*ms$" fold
syn region	vxtEMMBuild start="^#.*Build EMM.*" end="^Time.*ms$" fold
syn region	vxtECMEncrypt  start="^#.*Encrypt ECM PRM.*" end="^Time.*ms$" fold


syntax keyword Command_Header Header Le Lc Data Response Status Word Time Power Atr
highlight default link Command_Header ModeMsg
