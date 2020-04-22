const String dbsql_dbName = "pdv.db";

const String dbsql_createdb = ''' 
  CREATE TABLE Produtos(
    produtoId INTEGER PRIMARY KEY,
    produtoGrupoId INTEGER,
    codBarras TEXT,
    precoVenda REAL,
    produto TEXT,
    isAtivo INTEGER
  );

  CREATE TABLE ProdutoGrupos(
    produtoGrupoId INTEGER PRIMARY KEY,
    produtoGrupoPaiId INTEGER,
    grupo TEXT,
    isAtivo INTEGER
  );   
''';

const String dbsql_updatedb_v2 = '''alter table ProdutoGrupos add column grupoNomeCompleto TEXT''';
