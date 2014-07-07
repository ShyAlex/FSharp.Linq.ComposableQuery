﻿namespace FSharpComposableQuery

open Microsoft.FSharp.Quotations
open Microsoft.FSharp.Linq

module QueryImpl = 
    [<Class>]
    type QueryBuilder = 
        inherit Microsoft.FSharp.Linq.QueryBuilder

        member Run : q:Expr<Linq.QuerySource<'T, System.Linq.IQueryable>> -> System.Linq.IQueryable<'T>

[<AutoOpen>]
module LowPriority = 
    type QueryImpl.QueryBuilder with
        [<CompiledName("RunQueryAsValue")>]
        member Run : q:Expr<'T> -> 'T

[<AutoOpen>]
module HighPriority = 
    type QueryImpl.QueryBuilder with
        [<CompiledName("RunQueryAsEnumerable")>]
        member Run : q:Expr<QuerySource<'T, System.Collections.IEnumerable>> -> seq<'T>
        
[<AutoOpen>]
module TopLevelValues = 
    val query : QueryImpl.QueryBuilder