#ifndef NPKIT_STRUCT_H_
#define NPKIT_STRUCT_H_

#include <cstdint>

#pragma pack(push, 1)

union NpKitEvent {
  uint64_t bits[2];
  struct {
    uint64_t type : 8;
    uint64_t size : 32;
    uint64_t rsvd : 24;
    uint64_t timestamp;
  } fields;
};

union CPUEvent {
  uint64_t bits[2];
  struct {
    uint64_t type : 8;
    uint64_t size : 32;
    uint64_t rsvd : 24;
    uint64_t timestamp;
    uint64_t sender_rank : 8;
    uint64_t receiver_rank : 8;
    uint64_t step : 32;
  } fields;
};

struct NpKitEventCollectContext {
  NpKitEvent* event_buffer;
  uint64_t event_buffer_head;
};

struct CPUEventCollectContext {
  CPUEvent* event_buffer;
  uint64_t event_buffer_head;
};

#pragma pack(pop)

#endif
