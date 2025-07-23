#include <fuzzer/FuzzedDataProvider.h>
extern "C" {
#include <ngiflib.h>
}

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
  auto fdp = FuzzedDataProvider(data, size);
  auto file = fdp.ConsumeRandomLengthString();
  CheckGif((u8 *)(file.c_str()));

  return 0;
}
