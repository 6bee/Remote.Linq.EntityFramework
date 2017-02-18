# Remote.Linq.EntityFramework

| branch | package | AppVeyor | Travis |
| --- | --- | --- | --- |
| `master` | [![NuGet Badge](https://buildstats.info/nuget/Remote.Linq.EntityFramework?includePreReleases=true)](http://www.nuget.org/packages/Remote.Linq.EntityFramework) [![MyGet Pre Release](http://img.shields.io/myget/aqua/vpre/Remote.Linq.EntityFramework.svg?style=flat-square&label=myget)](https://www.myget.org/feed/aqua/package/nuget/Remote.Linq.EntityFramework) | [![Build status](https://ci.appveyor.com/api/projects/status/khlr1irj87vss8j9?svg=true)](https://ci.appveyor.com/project/6bee/remote-linq-entityframework) | [![Travis build Status](https://travis-ci.org/6bee/Remote.Linq.EntityFramework.svg?branch=master)](https://travis-ci.org/6bee/Remote.Linq.EntityFramework?branch=master) |


Remote linq extensions for entity framework. 

Use this package to apply eager-loading (`Include`-expressions) to EF queries.

## Sample

### Client

Query blogs including posts and owner

```C#
using (var repository = new RemoteRepository())
{
  var blogs = repository.Blogs
    .Include("Posts")
    .Include("Owner")
    .ToList();
}
```

### Server

Execute query on database via EF

```C#
public IEnumerable<DynamicObject> ExecuteQuery(Expression queryExpression)
{
  using (var dbContext = new EfDbContext())
  {
    return queryExpression.ExecuteWithEntityFrameworkCore(dbContext);
  }
}
```