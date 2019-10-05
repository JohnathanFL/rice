
hook global BufCreate .*/?.+\.zig %{
      set-option buffer filetype zig
}


add-highlighter shared/zig regions
add-highlighter shared/zig/code default-region group
add-highlighter shared/zig/comment region '//' $ fill comment
add-highlighter shared/zig/code/ regex \b(true|false|null|undefined)\b 0:value
add-highlighter shared/zig/code/ regex [iu][1-9]{1,3} 0:type

evaluate-commands %sh{
  zigStorage="const|var|extern|packed|export|pub|noalias|inline|noinline|comptime|nakedcc|stdcallcc|volatile|allowzero|align|linksection|threadlocal"
  zigStructure="struct|enum|union|error"
  zigStatement="break|return|continue|asm|defer|errdefer|unreachable|try|catch|async|noasync|await|suspend|resume"
  zigConditional="if|else|switch|and|or|orelse"
  zigRepeat="while|for"
  zigKeyword="fn|usingnamespace|test"
  zigKeywords="$zigStorage|$zigStructure|$zigStatement|$zigConditional|$zigRepeat|$zigKeyword"
  zigType="bool|f16|f32|f64|f128|void|noreturn|type|anyerror|anyframe|i0|u0|isize|usize|comptime_int|comptime_float|c_short|c_ushort|c_int|c_uint|c_long|c_ulong|c_longlong|c_ulonglong|c_longdouble|c_void"

  # TODO:
  zigOperator="((+%?)|(-%\?)|(/)|(*%?)|(=)|(^)|(&)|(\?)|(\|)|(!)|(>)|(<)|(%)|(<<%?)|>>)=?"
  
  zigBuiltinFn="@addWithOverflow|@ArgType|@atomicLoad|@bitCast|@breakpoint"
  zigBuiltinFn="$zigBuiltinFn|@alignCast|@alignOf|@cDefine|@cImport|@cInclude"
  zigBuiltinFn="$zigBuiltinFn|@cUndef|@canImplicitCast|@clz|@cmpxchgWeak|@cmpxchgStrong|@compileError"
  zigBuiltinFn="$zigBuiltinFn|@compileLog|@ctz|@popCount|@divExact|@divFloor|@divTrunc"
  zigBuiltinFn="$zigBuiltinFn|@embedFile|@export|@tagName|@TagType|@errorName"
  zigBuiltinFn="$zigBuiltinFn|@errorReturnTrace|@fence|@fieldParentPtr|@field|@unionInit"
  zigBuiltinFn="$zigBuiltinFn|@frameAddress|@import|@inlineCall|@newStackCall|@asyncCall|@intToPtr|@IntType"
  zigBuiltinFn="$zigBuiltinFn|@maxValue|@memberCount|@memberName|@memberType"
  zigBuiltinFn="$zigBuiltinFn|@memcpy|@memset|@minValue|@mod|@mulWithOverflow|@splat"
  zigBuiltinFn="$zigBuiltinFn|@noInlineCall|@bitOffsetOf|@byteOffsetOf|@OpaqueType|@panic|@ptrCast"
  zigBuiltinFn="$zigBuiltinFn|@ptrToInt|@rem|@returnAddress|@setCold|@Type|@shuffle"
  zigBuiltinFn="$zigBuiltinFn|@setRuntimeSafety|@setEvalBranchQuota|@setFloatMode"
  zigBuiltinFn="$zigBuiltinFn|@setGlobalLinkage|@setGlobalSection|@shlExact|@This|@hasDecl|@hasField"
  zigBuiltinFn="$zigBuiltinFn|@shlWithOverflow|@shrExact|@sizeOf|@sqrt|@byteSwap|@subWithOverflow|@intCast|@floatCast|@intToFloat|@floatToInt|@boolToInt|@errSetCast"
  zigBuiltinFn="$zigBuiltinFn|@truncate|@typeId|@typeInfo|@typeName|@typeOf|@atomicRmw|@bytesToSlice|@sliceToBytes"
  zigBuiltinFn="$zigBuiltinFn|@intToError|@errorToInt|@intToEnum|@enumToInt|@setAlignStack|@frame|@Frame|@frameSize|@bitReverse|@Vector"
  zigBuiltinFn="$zigBuiltinFn|@sin|@cos|@exp|@exp2|@ln|@log2|@log10|@fabs|@floor|@ceil|@trunc|@round"

  # TODO: Make this match either the full lexeme or nothing (i.e not matching the '1' in just '1.'
  zigHexNumber="[a-fA-F0-9]+([pP][+-]?[0-9]+)?"
  zigOctNumber="[0-7]+" # oh how blessedly simple
  zigBinNumber="[01]+(\.[01]+([eE][+-]?[0-9]+)?)?"
  # Needed to make it properly match any of the weird types
  zigWeirdNumber="0(x$zigHexNumber|o$zigOctNumber|b$zigBinNumber)"
  zigDecNumber="[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?"

  # Order is important here. If zigDecNumber goes first, only the '0' in '0xaf' will match 
  zigNumber="$zigWeirdNumber|$zigDecNumber"


  #zigEscapeError   /\\./
  zigEscape="\\\\([nrt\\'\"]|x\d{2})"
  zigEscapeUnicode="/\\\(u\x\{4}\|U\x\{6}\)/"

  zigString="\"($zigEscape|[^\"])*\""
  zigMultilineStringPre="c?\\\\"
  zigChar="'[^'^\n]*'"

  zigVarDesc="(var|const) (\w(\w|\d)*)(:\h*(\w(\w|\d)*))?\h*="
  
  printf %s\\n "declare-option str-list zig_static_words ${zigStorage} ${zigStructure} ${zigStatement} ${zigConditional} ${zigRepeat} ${zigConstant} ${zigKeyword} ${zigType}" | tr '|' ' '

  printf %s "
    add-highlighter shared/zig/code/ regex \b(${zigKeywords})\b 0:keyword
    add-highlighter shared/zig/code/ regex \b(${zigType})\b 0:type
    add-highlighter shared/zig/code/ regex (${zigBuiltinFn})\b 0:function
    add-highlighter shared/zig/code/ regex \b(${zigNumber}) 0:value
    add-highlighter shared/zig/code/ regex (${zigString}|${zigChar}) 0:meta
    add-highlighter shared/zig/code/ regex \h*$zigMultilineStringPre[^\n]*$ 0:meta
  "
}

hook global WinSetOption filetype=zig %{
  add-highlighter window/zig ref zig
}
hook global WinSetOption filetype=(?!zig).* %{
  remove-highlighter window/zig
}
