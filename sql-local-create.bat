@ECHO OFF
ECHO Starting Northwind SQL Database local deployment...

ECHO Execute scripts:

FOR /R "sql/do/" %%g IN (*.sql) DO ( 
  ECHO "%%g" | FIND /I "CreateDatabase">Nul && ( 
    ECHO "%%g"
    sqlcmd -U sa -P Bubon45!@# -S localhost -i"%%g"
  ) || (
    ECHO "%%g"
    sqlcmd -U sa -P Bubon45!@# -S localhost -d Northwind -i"%%g"
  )
)

PAUSE