%{

#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <iostream>
#include <stdexcept>

int yylex();
void yyerror (char const *s)
{
    throw std::runtime_error(s);
}

%}

%define parse.trace
%union{
  char *aString;
}

%type<aString> STRING machine_name turing_machine

%token BRACE_OPEN BRACE_CLOSE BRACKET_OPEN BRACKET_CLOSE COLON COMMA
%token STATE_LIST INITIAL_STATE FINAL_STATE_LIST ALPHABET EMPTY ENTRY TRANSISIONS VALID INVALID
%token MOVE WRITE BECOME
%token LEFT RIGHT STAY
%token STRING
%token END

%%

expression: turing_machine_set END { YYACCEPT; }

turing_machine_set: BRACE_OPEN turing_machine_list BRACE_CLOSE

turing_machine_list: named_turing_machine
| named_turing_machine COMMA turing_machine_list

named_turing_machine: machine_name { std::cout << "Parsing Turing Machine «" << $1 << "»:\n"; } COLON turing_machine

machine_name: STRING

turing_machine: BRACE_OPEN STATE_LIST COLON state_set BRACE_CLOSE

state_set: BRACKET_OPEN {  std::cout << "With states :\n";  } string_set BRACKET_CLOSE

string_set:
| STRING COMMA string_set { std::cout << $1 << ','; }
| STRING { std::cout << $1 << ','; }


target_string:

%%