%{

#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <iostream>
#include <stdexcept>

#include "turingparser.hpp"

#if defined(LLDEBUG)
    #define yield(expr) std::cout << #expr << std::endl; return expr
#else
    #define yield(expr) return expr
#endif
%}


QUOTE    \"
NOQUOTE [^\"]*
FLEX_STRING        {QUOTE}{NOQUOTE}{QUOTE}

%%

"{"                                {  yield(BRACE_OPEN); }
"}"                                {  yield(BRACE_CLOSE); }
"["                                {  yield(BRACKET_OPEN); }
"]"                                {  yield(BRACKET_CLOSE); }
":"                                {  yield(COLON); }
","                                {  yield(COMMA); }

"\"states\""                       {  yield(STATE_LIST); }
"\"initial\""                      {  yield(INITIAL_STATE); }
"\"final\""                        {  yield(FINAL_STATE_LIST); }
"\"alphabet\""                     {  yield(ALPHABET); }
"\"empty\""                        {  yield(EMPTY); }
"\"entry\""                        {  yield(ENTRY); }
"\"transitions\""                  {  yield(TRANSISIONS); }
"\"invalid\""                      {  yield(INVALID); }
"\"valid\""                        {  yield(VALID); }
"\"move\""                         {  yield(MOVE); }
"\"write\""                        {  yield(WRITE); }
"\"become\""                       {  yield(BECOME); }



{FLEX_STRING}                      {
char *ptr =  yytext;
while (*(ptr+1) != 0)
{
    ptr+=1;
}
*ptr=0;
yylval.aString = strdup(yytext+1);
yield(STRING);
}

[.\n\t ]                           ;

<<EOF>>                                 { yield(END); }

%%

