@ECHO OFF
ECHO Seeding local Northwind Database...

ECHO Execute scripts:

FOR /R "sql/seed/" %%g IN (*.sql) DO ( 
  ECHO "%%g"
  sqlcmd -U sa -P Bubon45!@# -S localhost -d Northwind -i"%%g"
)

PAUSE