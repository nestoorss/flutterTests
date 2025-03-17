void main() {
  bool isActive = true;
  check(isActive);
  isActive = false;
  check(isActive);
}

void check(bool isActive) {
  if (isActive) {
    print("SUUUUUUUUUUUUU");
  } else {
    print("no");
  }
}