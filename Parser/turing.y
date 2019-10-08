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

%token BRACE_OPEN BRACE_CLOSE BRACKET_OPEN BRACKET_CLOSE COLON COMMA
%token STATE_LIST INITIAL_STATE FINAL_STATE_LIST ALPHABET EMPTY ENTRY TRANSISIONS VALID INVALID
%token MOVE WRITE BECOME
%token LEFT RIGHT STAY
%token OBJECT LIST
%token STRING
%token EOL

%%

expression:
 | expression EOL

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

