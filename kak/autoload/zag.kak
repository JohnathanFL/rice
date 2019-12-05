# Detection

hook global BufCreate .*[.](zag) %{
    set-option buffer filetype zag
}

# Highlighters

add-highlighter shared/zag regions
add-highlighter shared/zag/code default-region group
add-highlighter shared/zag/string   region c?"       (?<!\\)(?:\\\\)*" group
add-highlighter shared/zag/mlstring region %{c?\\\\} $                 fill string
add-highlighter shared/zag/char     region c?'       (?<!\\)(?:\\\\)*' group

add-highlighter shared/zag/comment region \(: $|:\) fill comment
add-highlighter shared/zag/doc_comment region \(= $                 fill comment
add-highlighter shared/zag/code/ regex \.(addr|deref|has|val|ptr|len) 0:variable # Since these two can never be a valid field access otherwise

add-highlighter shared/zag/string/   fill string
add-highlighter shared/zag/char/     fill string

nop %sh{
    escape='\\(?:[nrt\\'\''"]|x[a-zA-Z0-9]{2}|u\{[a-zA-Z0-9]+\})'
    cat <<KAK
        add-highlighter shared/zag/string/ regex ${escape} 0:default+b
        add-highlighter shared/zag/char/ regex ${escape} 0:default+b
        add-highlighter shared/zag/char/ regex %{'(?:[^\\]|${escape})([^']+)'} 1:Error
KAK
}

add-highlighter shared/zag/code/ regex \b(const|field|let|var|extern|packed|export|pub|noalias|inline|comptime|nakedcc|stdcallcc|volatile|align|section)\b 0:keyword
add-highlighter shared/zag/code/ regex \b(block|struct|enum|union|concept|extend)\b 0:keyword
add-highlighter shared/zag/code/ regex \b(break|return|continue|asm|defer|errdefer|unreachable|try|catch|orelse|async|await|suspend|resume|cancel)\b 0:keyword
add-highlighter shared/zag/code/ regex \b(caseof|if|elif|finally|else|switch|and|or|xor)\b 0:keyword
add-highlighter shared/zag/code/ regex \b(while|for|loop)\b 0:keyword
add-highlighter shared/zag/code/ regex \b(purefn|fn|use|test)\b 0:keyword

add-highlighter shared/zag/code/ regex \b(bool|f32|f64|f128|void|noreturn|type|error|promise)\b 0:type
add-highlighter shared/zag/code/ regex \b(u\d+|i\d+|isize|usize)\b|\b(\d+(\.\d+)?)(u\d+|i\d+|isize|usize|f32|f64)\b 1:type 2:variable 4:type
add-highlighter shared/zag/code/ regex \b(c_short|c_ushort|c_int|c_uint|c_long|c_ulong|c_longlong|c_ulonglong|c_longdouble|c_void)\b 0:type

add-highlighter shared/zag/code/ regex \b(null|undef|this)\b 0:variable
add-highlighter shared/zag/code/ regex \b(true|false)\b 0:value
add-highlighter shared/zag/code/ regex \b[0-9]+(?:.[0-9]+)?(?:[eE][+-]?[0-9]+)? 0:value # decimal numeral
add-highlighter shared/zag/code/ regex \b0x[a-fA-F0-9]+(?:[a-fA-F0-9]+(?:[pP][+-]?[0-9]+)?)? 0:value # hexadecimal numeral
add-highlighter shared/zag/code/ regex \b0o[0-7]+ 0:value # octal numeral
add-highlighter shared/zag/code/ regex \b0b[01]+(?:.[01]\+(?:[eE][+-]?[0-9]+)?)?" 0:value # binary numeral

add-highlighter shared/zag/code/ regex @(addWithOverflow|alignCast|alignOf|ArgType|atomicLoad|atomicRmw|bitCast|bitOffsetOf|boolToInt|breakpoint|bswap|bitreverse|byteOffsetOf|bytesToSlice|cDefine|cImport|cInclude|clz|cmpxchgStrong|cmpxchgWeak|compileError|compileLog|ctz|cUndef|divExact|divFloor|divTrunc|embedFile|enumToInt|errorName|errorReturnTrace|errorToInt|errSetCast|export|fence|field|fieldParentPtr|floatCast|floatToInt|frameAddress|handle|import|inlineCall|intCast|intToEnum|intToError|intToFloat|intToPtr|IntType|memberCount|memberName|memberType|memcpy|memset|mod|mulWithOverflow|newStackCall|noInlineCall|OpaqueType|panic|popCount|ptrCast|ptrToInt|rem|returnAddress|setAlignStack|setCold|setEvalBranchQuota|setFloatMode|setGlobalLinkage|setRuntimeSafety|shlExact|shlWithOverflow|shrExact|sizeOf|sliceToBytes|sqrt|subWithOverflow|tagName|TagType|This|truncate|typeId|typeInfo|typeName|typeOf|Vector)\b 0:builtin

add-highlighter shared/zag/code/ regex ((\+|-|\*|<<)%?|/|=|\^|&|\?|\||!|>|<|%|>>)=? 0:operator
add-highlighter shared/zag/code/ regex -> 0:operator



add-highlighter shared/zag/code/  regex `(\w|\d)+\b 0:variable

# Commands

define-command -hidden zag-filter-around-selections %{
    # remove trailing whitspace
    try %{ execute-keys -draft -itersel <a-x> s\h+$<ret> d }
}

define-command -hidden zag-indent-on-new-line %[
    evaluate-commands -draft -itersel %[
        # copy comment prefix //
        try %{ execute-keys -draft k <a-x> s^\h*\K///?\h*<ret> y gh j P }
        # preserve indent
        try %{ execute-keys -draft ';' K <a-&> }
        # filter previous line
        try %{ execute-keys -draft k :zag-filter-around-selections<ret> }
        # indent after lines ending with { or (
        try %[ execute-keys -draft k <a-x> <a-k>[{(]\h*$<ret> j <a-gt> ]
    ]
]

define-command -hidden zag-indent-on-closing-curly-brace %[
    evaluate-commands -draft -itersel %[
        # align to opening brace when the closing brace is the only thing on this line
        try %[ execute-keys -draft <a-h> <a-k>^\h+\}$<ret> h m s\A|.\z<ret> 1<a-&> ]
    ]
]

# Initialization

hook -group zag-highlight global WinSetOption filetype=zag %{
    add-highlighter window/zag ref zag

    hook -once -always window WinSetOption filetype=.* %{
        remove-highlighter window/zag
    }
}

hook global WinSetOption filetype=zag %[
    set-option buffer comment_line '//'
    hook -group zag-hooks window ModeChange insert:.* zag-filter-around-selections
    hook -group zag-indent window InsertChar \n zag-indent-on-new-line
    hook -group zag-indent window InsertChar \} zag-indent-on-closing-curly-brace

    hook -once -always window WinSetOption filetype=.* %{
        remove-hooks window zag-.+
    }
]
