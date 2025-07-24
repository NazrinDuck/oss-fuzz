#include <fuzzer/FuzzedDataProvider.h>

#include <loguru.hpp>

#include <chrono>
#include <string>
#include <thread>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
  auto fdp = FuzzedDataProvider(data, size);
  auto format = fdp.ConsumeRandomLengthString();

  int argc = 1;
  loguru::init(argc, nullptr);
  LOG_F(INFO, format.c_str());

  return 0;
}
