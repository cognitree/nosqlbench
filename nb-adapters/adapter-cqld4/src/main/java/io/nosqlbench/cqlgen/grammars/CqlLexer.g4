lexer grammar CqlLexer;

options {
	caseInsensitive = true;
}

// Operators and Punctuators

LR_BRACKET: '(' -> pushMode(IDENTIFIER_MODE);
RR_BRACKET: ')';
LC_BRACKET: '{' -> pushMode(IDENTIFIER_MODE);
RC_BRACKET: '}';
LS_BRACKET: '[' -> pushMode(IDENTIFIER_MODE);
RS_BRACKET: ']';
COMMA: ',' -> pushMode(IDENTIFIER_MODE);
SEMI: ';';
COLON: ':';
DOT: '.' -> pushMode(IDENTIFIER_MODE);
STAR: '*';
DIVIDE: '/';
MODULE: '%';
PLUS: '+' -> pushMode(IDENTIFIER_MODE);
MINUSMINUS: '--';
MINUS: '-';
DQUOTE: '"';
SQUOTE: '\'';
OPERATOR_EQ: '=' -> pushMode(IDENTIFIER_MODE);
OPERATOR_LT: '<' -> pushMode(IDENTIFIER_MODE);
OPERATOR_GT: '>';
OPERATOR_LTE: '<=';
OPERATOR_GTE: '>=';

// Keywords

K_ADD: 'ADD';
K_AGGREGATE: 'AGGREGATE';
K_ALL: 'ALL';
K_ALLOW: 'ALLOW';
K_ALTER: 'ALTER';
K_AND: 'AND' -> pushMode(IDENTIFIER_MODE);
K_ANY: 'ANY';
K_APPLY: 'APPLY';
K_AS: 'AS';
K_ASC: 'ASC';
K_AUTHORIZE: 'AUTHORIZE';
K_BATCH: 'BATCH';
K_BEGIN: 'BEGIN';
K_BY: 'BY';
K_CALLED: 'CALLED';
K_CLUSTERING: 'CLUSTERING';
K_COLUMNFAMILY: 'COLUMNFAMILY';
K_COMPACT:  'COMPACT';
K_CONSISTENCY: 'CONSISTENCY';
K_CONTAINS: 'CONTAINS';
K_CREATE: 'CREATE';
K_CUSTOM: 'CUSTOM';
K_DELETE: 'DELETE';
K_DESC: 'DESC';
K_DESCRIBE: 'DESCRIBE';
K_DISTINCT: 'DISTINCT';
K_DROP: 'DROP';
K_DURABLE_WRITES: 'DURABLE_WRITES';
K_EACH_QUORUM: 'EACH_QUORUM';
K_ENTRIES: 'ENTRIES';
K_EXECUTE: 'EXECUTE';
K_EXISTS: 'EXISTS' -> pushMode(IDENTIFIER_MODE);
K_FALSE: 'FALSE';
K_FILTERING: 'FILTERING';
K_FINALFUNC: 'FINALFUNC';
K_FROM: 'FROM';
K_FULL: 'FULL';
K_FUNCTION: 'FUNCTION';
K_FUNCTIONS: 'FUNCTIONS';
K_GRANT: 'GRANT';
K_IF: 'IF';
K_IN: 'IN';
K_INDEX: 'INDEX';
K_INFINITY: 'INFINITY';
K_INITCOND: 'INITCOND';
K_INPUT: 'INPUT';
K_INSERT: 'INSERT';
K_INTO: 'INTO';
K_IS: 'IS';
K_JSON: 'JSON';
K_KEY: 'KEY';
K_KEYS: 'KEYS';
K_KEYSPACE: 'KEYSPACE' -> pushMode(IDENTIFIER_MODE);
K_KEYSPACES: 'KEYSPACES';
K_LANGUAGE: 'LANGUAGE';
// Disabled because there was no definitive reference to this as a bare keyword in the specs
//K_LEVEL: 'LEVEL';
K_LIMIT: 'LIMIT';
K_LOCAL_ONE: 'LOCAL_ONE';
K_LOCAL_QUORUM: 'LOCAL_QUORUM';
K_LOGGED: 'LOGGED';
K_LOGIN: 'LOGIN';
K_MATERIALIZED: 'MATERIALIZED';
K_MODIFY: 'MODIFY';
K_NAN: 'NAN';
K_NORECURSIVE: 'NORECURSIVE';
K_NOSUPERUSER: 'NOSUPERUSER';
K_NOT: 'NOT';
K_NULL: 'NULL';
K_OF: 'OF' -> pushMode(IDENTIFIER_MODE);
K_ON: 'ON' -> pushMode(IDENTIFIER_MODE);
K_ONE: 'ONE';
K_OPTIONS: 'OPTIONS';
K_OR: 'OR';
K_ORDER: 'ORDER';
K_PARTITION: 'PARTITION';
K_PASSWORD: 'PASSWORD';
K_PER: 'PER';
K_PERMISSION: 'PERMISSION';
K_PERMISSIONS: 'PERMISSIONS';
K_PRIMARY: 'PRIMARY';
K_QUORUM: 'QUORUM';
K_RENAME: 'RENAME' -> pushMode(IDENTIFIER_MODE);
K_REPLACE: 'REPLACE';
K_REPLICATION: 'REPLICATION';
K_RETURNS: 'RETURNS';
K_REVOKE: 'REVOKE';
K_ROLE: 'ROLE';
K_ROLES: 'ROLES';
K_SCHEMA: 'SCHEMA';
K_SELECT: 'SELECT';
K_SET_WITH_OPERATOR_LT: K_SET SPACE? OPERATOR_LT -> pushMode(IDENTIFIER_MODE);
K_SET: 'SET' -> pushMode(IDENTIFIER_MODE);
K_SFUNC: 'SFUNC';
K_STATIC: 'STATIC';
K_STORAGE: 'STORAGE';
K_STYPE: 'STYPE';
K_SUPERUSER: 'SUPERUSER';
K_TABLE: 'TABLE' -> pushMode(IDENTIFIER_MODE);
K_THREE: 'THREE';
K_TIMESTAMP_WITH_DECIMAL_LITERAL: K_TIMESTAMP SPACE DECIMAL_LITERAL;
K_TIMESTAMP: 'TIMESTAMP';
K_TO: 'TO' -> pushMode(IDENTIFIER_MODE);
K_TOKEN: 'TOKEN';
K_TRIGGER: 'TRIGGER';
K_TRUE: 'TRUE';
K_TRUNCATE: 'TRUNCATE' -> pushMode(IDENTIFIER_MODE);
K_TTL: 'TTL';
K_TWO: 'TWO';
K_TYPE: 'TYPE' -> pushMode(IDENTIFIER_MODE);
K_UNLOGGED: 'UNLOGGED';
K_UPDATE: 'UPDATE' -> pushMode(IDENTIFIER_MODE);
K_USE: 'USE' -> pushMode(IDENTIFIER_MODE);
K_USER: 'USER';
K_USING: 'USING';
K_UUID: 'UUID';
K_VALUES: 'VALUES';
K_VIEW: 'VIEW';
K_WHERE: 'WHERE' -> pushMode(IDENTIFIER_MODE);
K_WITH: 'WITH';
K_WRITETIME: 'WRITETIME';
K_ASCII: 'ASCII';
K_BIGINT: 'BIGINT';
K_BLOB: 'BLOB';
K_BOOLEAN: 'BOOLEAN';
K_COUNTER: 'COUNTER';
K_DATE: 'DATE';
K_DECIMAL: 'DECIMAL';
K_DOUBLE: 'DOUBLE';
K_FLOAT: 'FLOAT';
K_FROZEN_WITH_OPERATOR_LT: K_FROZEN SPACE? OPERATOR_LT -> pushMode(IDENTIFIER_MODE);
K_FROZEN: 'FROZEN';
K_INET: 'INET';
K_INT: 'INT';
K_LIST_WITH_OPERATOR_LT: K_LIST SPACE? OPERATOR_LT -> pushMode(IDENTIFIER_MODE);
K_LIST: 'LIST';
K_MAP_WITH_OPERATOR_LT: K_MAP SPACE? OPERATOR_LT -> pushMode(IDENTIFIER_MODE);
K_MAP: 'MAP';
K_SMALLINT: 'SMALLINT';
K_TEXT: 'TEXT';
K_TIMEUUID: 'TIMEUUID';
K_TIME: 'TIME';
K_TINYINT: 'TINYINT';
K_TUPLE: 'TUPLE';
K_VARCHAR: 'VARCHAR';
K_VARINT: 'VARINT';

// Literals

CODE_BLOCK: '$$' (~ '$' | '$' ~'$')* '$$';

STRING_LITERAL: '\'' ('\\' . | '\'\'' | ~('\'' | '\\'))* '\'';

DECIMAL_LITERAL: DEC_DIGIT+;

FLOAT_LITERAL: MINUS? [0-9]+ (DOT [0-9]+)?;

HEXADECIMAL_LITERAL
   : 'X' '\'' (HEX_DIGIT HEX_DIGIT)+ '\''
	| '0X' HEX_DIGIT+
   ;

REAL_LITERAL
	: DEC_DIGIT+ '.'? EXPONENT_NUM_PART
	| DEC_DIGIT* '.' DEC_DIGIT+ EXPONENT_NUM_PART?
   ;

OBJECT_NAME
   : [A-Z] [A-Z0-9_$]*
	| '"' ~'"'+ '"'
   ;

UUID: HEX_4DIGIT HEX_4DIGIT '-' HEX_4DIGIT '-' HEX_4DIGIT '-' HEX_4DIGIT '-' HEX_4DIGIT HEX_4DIGIT HEX_4DIGIT;

// Hidden

SPACE: [ \t\r\n]+ -> channel (HIDDEN);
SPEC_MYSQL_COMMENT: '/*!' .+? '*/' -> channel (HIDDEN);
COMMENT_INPUT: '/*' .*? '*/' -> channel (HIDDEN);
LINE_COMMENT: (
		('-- ' | '#' | '//') ~ [\r\n]* ('\r'? '\n' | EOF)
		| '--' ('\r'? '\n' | EOF)
	) -> channel (HIDDEN);

// Fragments

fragment HEX_4DIGIT: [0-9A-F] [0-9A-F] [0-9A-F] [0-9A-F];

fragment HEX_DIGIT: [0-9A-F];

fragment DEC_DIGIT: [0-9];

fragment EXPONENT_NUM_PART: 'E' ('-'|'+') ? DEC_DIGIT+;

mode IDENTIFIER_MODE;

SEMI_: SEMI -> type(SEMI), popMode;
LC_BRACKET_: LC_BRACKET -> type(LC_BRACKET);
LS_BRACKET_: LS_BRACKET -> type(LS_BRACKET);
LR_BRACKET_: LR_BRACKET -> type(LR_BRACKET);
OPERATOR_LT_: OPERATOR_LT -> type(OPERATOR_LT);

RR_BRACKET_: RR_BRACKET -> type(RR_BRACKET), popMode;
RC_BRACKET_: RC_BRACKET -> type(RC_BRACKET), popMode;
RS_BRACKET_: RS_BRACKET -> type(RS_BRACKET), popMode;

OPERATOR_GT_: OPERATOR_GT -> type(OPERATOR_GT), popMode;

// Reserved Keywords which cannot be used as identifiers
// https://cassandra.apache.org/doc/4.1/cassandra/cql/appendices.html#appendix-A
K_ADD_: K_ADD -> type(K_ADD), popMode;
K_AGGREGATE_: K_AGGREGATE -> type(K_AGGREGATE), popMode;
K_ALLOW_: K_ALLOW -> type(K_ALLOW), popMode;
K_ALTER_: K_ALTER -> type(K_ALTER), popMode;
K_AND_: K_AND -> type(K_AND), popMode;
K_ANY_: K_ANY -> type(K_ANY), popMode;
K_APPLY_: K_APPLY -> type(K_APPLY), popMode;
K_ASC_: K_ASC -> type(K_ASC), popMode;
K_AUTHORIZE_: K_AUTHORIZE -> type(K_AUTHORIZE), popMode;
K_BATCH_: K_BATCH -> type(K_BATCH), popMode;
K_BEGIN_: K_BEGIN -> type(K_BEGIN), popMode;
K_BY_: K_BY -> type(K_BY), popMode;
K_COLUMNFAMILY_: K_COLUMNFAMILY -> type(K_COLUMNFAMILY), popMode;
K_CREATE_: K_CREATE -> type(K_CREATE), popMode;
K_DELETE_: K_DELETE -> type(K_DELETE), popMode;
K_DESC_: K_DESC -> type(K_DESC), popMode;
K_DROP_: K_DROP -> type(K_DROP), popMode;
K_DURABLE_WRITES_: K_DURABLE_WRITES -> type(K_DURABLE_WRITES), popMode;
K_ENTRIES_: K_ENTRIES -> type(K_ENTRIES), popMode;
K_FALSE_: K_FALSE -> type(K_FALSE), popMode;
K_FROM_: K_FROM -> type(K_FROM), popMode;
K_FULL_: K_FULL -> type(K_FULL), popMode;
K_GRANT_: K_GRANT -> type(K_GRANT), popMode;
K_IF_: K_IF -> type(K_IF), popMode;
K_IN_: K_IN -> type(K_IN), popMode;
K_INDEX_: K_INDEX -> type(K_INDEX), popMode;
K_INFINITY_: K_INFINITY -> type(K_INFINITY), popMode;
K_INSERT_: K_INSERT -> type(K_INSERT), popMode;
K_INTO_:  K_INTO -> type(K_INTO), popMode;
//K_IS: 'IS';
K_KEYSPACE_: K_KEYSPACE -> type(K_KEYSPACE), popMode;
K_LIMIT_: K_LIMIT -> type(K_LIMIT), popMode;
K_LOGGED_: K_LOGGED -> type(K_LOGGED), popMode;
K_MODIFY_: K_MODIFY -> type(K_MODIFY), popMode;
K_NAN_: K_NAN -> type(K_NAN), popMode;
K_NORECURSIVE_: K_NORECURSIVE -> type(K_NORECURSIVE), popMode;
K_NOT_: K_NOT -> type(K_NOT), popMode;
K_NULL_: K_NULL -> type(K_NULL), popMode;
K_OF_: K_OF -> type(K_OF), popMode;
K_ON_: K_ON -> type(K_ON), popMode;
K_OR_: K_OR -> type(K_OR), popMode;
K_ORDER_: K_ORDER -> type(K_ORDER), popMode;
K_PRIMARY_: K_PRIMARY -> type(K_PRIMARY), popMode;
K_RENAME_: K_RENAME -> type(K_RENAME), popMode;
K_REPLACE_: K_REPLACE -> type(K_REPLACE), popMode;
K_REVOKE_: K_REVOKE -> type(K_REVOKE), popMode;
K_SCHEMA_: K_SCHEMA -> type(K_SCHEMA), popMode;
K_SELECT_: K_SELECT -> type(K_SELECT), popMode;
K_SET_: K_SET -> type(K_SET), popMode;
K_TABLE_: K_TABLE -> type(K_TABLE), popMode;
K_TO_: K_TO -> type(K_TO), popMode;
K_TOKEN_: K_TOKEN -> type(K_TOKEN), popMode;
K_TRUNCATE_: K_TRUNCATE -> type(K_TRUNCATE), popMode;
K_UNLOGGED_: K_UNLOGGED -> type(K_UNLOGGED), popMode;
K_UPDATE_: K_UPDATE -> type(K_UPDATE), popMode;
K_USE_: K_USE -> type(K_USE), popMode;
K_USING_: K_USING -> type(K_USING), popMode;
K_WHERE_: K_WHERE -> type(K_WHERE), popMode;
K_WITH_: K_WITH -> type(K_WITH), popMode;

// handeling cases like 'frozen<','map<','list<','set<' and 'TIMESTAMP WITH 1234'
K_MAP_WITH_OPERATOR_LT_: K_MAP_WITH_OPERATOR_LT -> type(K_MAP_WITH_OPERATOR_LT);
K_TIMESTAMP_WITH_DECIMAL_LITERAL_: K_TIMESTAMP_WITH_DECIMAL_LITERAL -> type(K_TIMESTAMP_WITH_DECIMAL_LITERAL);
K_FROZEN_WITH_OPERATOR_LT_: K_FROZEN_WITH_OPERATOR_LT -> type(K_FROZEN_WITH_OPERATOR_LT);
K_SET_WITH_OPERATOR_LT_: K_SET_WITH_OPERATOR_LT -> type(K_SET_WITH_OPERATOR_LT);
K_LIST_WITH_OPERATOR_LT_: K_LIST_WITH_OPERATOR_LT -> type(K_LIST_WITH_OPERATOR_LT);

OBJECT_NAME_ : OBJECT_NAME -> type(OBJECT_NAME), popMode;
SPACE_: [ \t\r\n]+ -> channel (HIDDEN);

UUID_: UUID -> type(UUID), popMode;

// Literals
CODE_BLOCK_: CODE_BLOCK -> type(CODE_BLOCK), popMode;
STRING_LITERAL_: STRING_LITERAL -> type(STRING_LITERAL), popMode;
DECIMAL_LITERAL_: DECIMAL_LITERAL -> type(DECIMAL_LITERAL), popMode;
FLOAT_LITERAL_: FLOAT_LITERAL -> type(FLOAT_LITERAL), popMode;
HEXADECIMAL_LITERAL_: HEXADECIMAL_LITERAL -> type(HEXADECIMAL_LITERAL), popMode;
REAL_LITERAL_ : REAL_LITERAL -> type(REAL_LITERAL), popMode;

