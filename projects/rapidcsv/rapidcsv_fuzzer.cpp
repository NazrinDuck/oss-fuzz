#include <fuzzer/FuzzedDataProvider.h>
#include <rapidcsv.h>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
  auto fdp = FuzzedDataProvider(data, size);
  auto file = fdp.ConsumeRandomLengthString();

  return 0;
}
