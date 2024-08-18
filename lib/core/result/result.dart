sealed class Result<T,E> {}

class Success<T, E> extends Result<T,E>{
  final T value;
  Success(this.value);
}

class Error<T, E> extends Result<T,E>{
  final E value;
  Error(this.value);
}