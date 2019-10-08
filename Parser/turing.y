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

%define parse.trace

%%

expression: turing_machine_set END { YYACCEPT; }

turing_machine_set: BRACE_OPEN turing_machine_list BRACE_CLOSE

turing_machine_list: named_turing_machine COMMA turing_machine_list
| named_turing_machine

named_turing_machine: machine_name COLON turing_machine { std::cout << "Parsing Turing Machine " << $1 << " avec string "  << $3 << std::endl; }

machine_name: STRING
turing_machine: STRING


%%

int main(){
    try
    {
        yyparse();
    }
    catch(const std::runtime_error &e)
    {
    	std::cerr << "Bison error : " << e.what() << std::endl;
    }
    return 0;
}

