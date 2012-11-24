object SListIter[T, L:SList[T]] is Iterator[T]
{
  var _next:L|None

  new( _next )

  function has_next()->( _next != None )

  function~ next()->( r:T ) throws
  {
    match _next
    {
      case None { throw }

      case as n:L
      {
        r = n.item()
        _next = _next.next()
      }
    }
  }
}

object SList[T] is List[T]
{
  var _item:T
  var _next:SList[T]|None

  new( _item, _next = None )

  function item()->( _item )
  function~ set_item( _item )

  function next()->( _next )
  function~ set_next( _next )

  function iterator()->( SListIter[T, SList[:this][T]]( this ) )
}
