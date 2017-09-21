@echo off
set configuration=Debug
set version-suffix="001"
clean ^
  && dotnet restore ^
  && dotnet build src\Remote.Linq.EntityFramework --configuration %configuration% ^
  && dotnet build test\Remote.Linq.EntityFramework.Tests --configuration %configuration% ^
  && dotnet test test\Remote.Linq.EntityFramework.Tests\Remote.Linq.EntityFramework.Tests.csproj --configuration %configuration% ^
  && dotnet pack src\Remote.Linq.EntityFramework\Remote.Linq.EntityFramework.csproj --output "..\..\artifacts" --configuration %configuration% --include-symbols --version-suffix "%version-suffix%"