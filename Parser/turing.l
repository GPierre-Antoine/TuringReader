%{
#include "turing.tab.h"
%}

QUOTE    \"
NOQUOTE [^\"]*
FLEX_STRING        {QUOTE}{NOQUOTE}{QUOTE}
%%

"{"                                { return BRACE_OPEN; }
"}"                                { return BRACE_CLOSE; }
"["                                { return BRACKET_OPEN; }
"]"                                { return BRACKET_CLOSE; }
":"                                { return COLON; }
","                                { return COMMA; }

"\"states\""                       { return STATE_LIST; }
"\"initial\""                      { return INITIAL_STATE; }
"\"final\""                        { return FINAL_STATE_LIST; }
"\"alphabet\""                     { return ALPHABET; }
"\"empty\""                        { return EMPTY; }
"\"entry\""                        { return ENTRY; }
"\"transitions\""                  { return TRANSISIONS; }
"\"invalid\""                      { return INVALID; }
"\"valid\""                        { return VALID; }
"\"move\""                         { return MOVE; }
"\"write\""                        { return WRITE; }
"\"become\""                       { return BECOME; }



{FLEX_STRING}                      { return STRING; }

.                                  ;

%%
