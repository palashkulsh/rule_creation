
/* description: Parses end executes mathematical expressions. */

/* lexical grammar */
%lex
%%

\s+                   /* skip whitespace */
[0-9]+("."[0-9]+)?\b  return 'NUMBER'
">" return 'OPERATOR'
"<" return 'OPERATOR'
">=" return 'OPERATOR'
"<=" return 'OPERATOR'
"and" return 'AND'
"AND" return 'AND'
"selling"\s+"price" return "SP"
<<EOF>> return 'EOF'
. return 'INVALID'

/lex

/* operator associations and precedence */


%start expressions

%% /* language grammar */

expressions
    : statements EOF 
    { return $1}

;

statement
        : SP OPERATOR NUMBER
	{$$={rule_key:'SELLINGPRICE',rule_operator:$2,rule_value:$3};}
;

statements
: statement
{$$=[$1];}
| statements AND statement
{$1.push($3);$$=$1;}
;
