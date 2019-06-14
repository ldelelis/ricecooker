module core.utils.array;

auto isIncluded(T)(const T[] collection, T element) {
    foreach (T it; collection) {
        if (it == element) {
            return true;
        }
    }
    return false;
}
