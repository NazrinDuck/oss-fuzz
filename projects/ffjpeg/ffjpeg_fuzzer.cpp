#include <fuzzer/FuzzedDataProvider.h>
#include <jfif.h>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
  auto fdp = FuzzedDataProvider(data, size);
  auto file = fdp.ConsumeRandomLengthString();
  jfif_load((char *)(file.c_str()));

  return 0;
}
