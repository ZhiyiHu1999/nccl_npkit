#!/bin/bash

cd nccl

# module load cuda/11.6.2
# module load cuda/12.1.1
module load cuda/11.8.0
module list

make clean

export NPKIT_FLAGS="-DENABLE_NPKIT -DENABLE_NPKIT_EVENT_TIME_SYNC_CPU -DENABLE_NPKIT_EVENT_TIME_SYNC_GPU \
 -DENABLE_NPKIT_EVENT_GPU_1_ALL_REDUCE_RING_ENTRY -DENABLE_NPKIT_EVENT_GPU_1_ALL_REDUCE_RING_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_RING_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_RING_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_RING_RECV_REDUCE_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_RING_RECV_REDUCE_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_RING_DIRECT_RECV_REDUCE_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_RING_DIRECT_RECV_REDUCE_COPY_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_RING_DIRECT_RECV_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_RING_DIRECT_RECV_COPY_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_RING_DIRECT_RECV_ENTRY -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_RING_DIRECT_RECV_EXIT \
 -DENABLE_NPKIT_EVENT_ALL_REDUCE_TREE_UPDOWN_ENTRY -DENABLE_NPKIT_EVENT_ALL_REDUCE_TREE_UPDOWN_EXIT \
 -DENABLE_NPKIT_EVENT_ALL_REDUCE_TREE_UPDOWN_REDUCE_ENTRY -DENABLE_NPKIT_EVENT_ALL_REDUCE_TREE_UPDOWN_REDUCE_EXIT \
 -DENABLE_NPKIT_EVENT_ALL_REDUCE_TREE_UPDOWN_BROADCAST_ENTRY -DENABLE_NPKIT_EVENT_ALL_REDUCE_TREE_UPDOWN_BROADCAST_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_1_ALL_REDUCE_TREE_SPLIT_ENTRY -DENABLE_NPKIT_EVENT_GPU_1_ALL_REDUCE_TREE_SPLIT_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_TREE_SPLIT_REDUCE_BROADCAST_ENTRY -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_TREE_SPLIT_REDUCE_BROADCAST_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_TREE_SPLIT_REDUCE_ENTRY -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_TREE_SPLIT_REDUCE_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_TREE_SPLIT_BROADCAST_ENTRY -DENABLE_NPKIT_EVENT_GPU_2_ALL_REDUCE_TREE_SPLIT_BROADCAST_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_COPY_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_DIRECT_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_DIRECT_COPY_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_DIRECT_RECV_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_DIRECT_RECV_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_DIRECT_RECV_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_DIRECT_RECV_COPY_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_DIRECT_RECV_REDUCE_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_DIRECT_RECV_REDUCE_COPY_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_DIRECT_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_DIRECT_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_DIRECT_SEND_FROM_OUTPUT_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_DIRECT_SEND_FROM_OUTPUT_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_RECV_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_RECV_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_RECV_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_RECV_COPY_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_RECV_REDUCE_COPY_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_RECV_REDUCE_COPY_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_RECV_REDUCE_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_RECV_REDUCE_COPY_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_RECV_REDUCE_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_RECV_REDUCE_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_SEND_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_GPU_OP_SEND_FROM_OUTPUT_ENTRY -DENABLE_NPKIT_EVENT_GPU_OP_SEND_FROM_OUTPUT_EXIT \
 -DENABLE_NPKIT_EVENT_PRIM_SIMPLE_WAIT_PEER_ENTRY -DENABLE_NPKIT_EVENT_PRIM_SIMPLE_WAIT_PEER_EXIT \
 -DENABLE_NPKIT_EVENT_PRIM_SIMPLE_REDUCE_OR_COPY_MULTI_ENTRY -DENABLE_NPKIT_EVENT_PRIM_SIMPLE_REDUCE_OR_COPY_MULTI_EXIT \
 -DENABLE_NPKIT_EVENT_PRIM_LL_WAIT_SEND_ENTRY -DENABLE_NPKIT_EVENT_PRIM_LL_WAIT_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_PRIM_LL_DATA_PROCESS_ENTRY -DENABLE_NPKIT_EVENT_PRIM_LL_DATA_PROCESS_EXIT \
 -DENABLE_NPKIT_EVENT_PRIM_LL128_WAIT_SEND_ENTRY -DENABLE_NPKIT_EVENT_PRIM_LL128_WAIT_SEND_EXIT \
 -DENABLE_NPKIT_EVENT_PRIM_LL128_DATA_PROCESS_ENTRY -DENABLE_NPKIT_EVENT_PRIM_LL128_DATA_PROCESS_EXIT \
 -DENABLE_NPKIT_EVENT_NET_SEND_ENTRY -DENABLE_NPKIT_EVENT_NET_SEND_EXIT -DENABLE_NPKIT_EVENT_NET_RECV_ENTRY -DENABLE_NPKIT_EVENT_NET_RECV_EXIT \
 -DENABLE_NPKIT_EVENT_NET_SEND_TEST_ENTRY -DENABLE_NPKIT_EVENT_NET_SEND_TEST_EXIT -DENABLE_NPKIT_EVENT_NET_RECV_TEST_ENTRY -DENABLE_NPKIT_EVENT_NET_RECV_TEST_EXIT \
 -DENABLE_NPKIT_EVENT_NPKIT_INIT_ENTRY -DENABLE_NPKIT_EVENT_NPKIT_INIT_EXIT"

# export NPKIT_FLAGS="-DENABLE_NPKIT -DENABLE_NPKIT_EVENT_TIME_SYNC_CPU -DENABLE_NPKIT_EVENT_TIME_SYNC_GPU -DENABLE_NPKIT_EVENT_ALL_REDUCE_RING_ENTRY -DENABLE_NPKIT_EVENT_ALL_REDUCE_RING_EXIT \
#  -DENABLE_NPKIT_EVENT_ALL_REDUCE_TREE_UPDOWN_ENTRY -DENABLE_NPKIT_EVENT_ALL_REDUCE_TREE_UPDOWN_EXIT \
#  -DENABLE_NPKIT_EVENT_ALL_REDUCE_TREE_SPLIT_ENTRY -DENABLE_NPKIT_EVENT_ALL_REDUCE_TREE_SPLIT_EXIT \
#  -DENABLE_NPKIT_EVENT_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_COPY_SEND_EXIT \
#  -DENABLE_NPKIT_EVENT_DIRECT_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_DIRECT_COPY_SEND_EXIT \
#  -DENABLE_NPKIT_EVENT_DIRECT_RECV_ENTRY -DENABLE_NPKIT_EVENT_DIRECT_RECV_EXIT \
#  -DENABLE_NPKIT_EVENT_DIRECT_RECV_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_DIRECT_RECV_COPY_SEND_EXIT \
#  -DENABLE_NPKIT_EVENT_DIRECT_RECV_REDUCE_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_DIRECT_RECV_REDUCE_COPY_SEND_EXIT \
#  -DENABLE_NPKIT_EVENT_DIRECT_SEND_ENTRY -DENABLE_NPKIT_EVENT_DIRECT_SEND_EXIT \
#  -DENABLE_NPKIT_EVENT_DIRECT_SEND_FROM_OUTPUT_ENTRY -DENABLE_NPKIT_EVENT_DIRECT_SEND_FROM_OUTPUT_EXIT \
#  -DENABLE_NPKIT_EVENT_RECV_ENTRY -DENABLE_NPKIT_EVENT_RECV_EXIT \
#  -DENABLE_NPKIT_EVENT_RECV_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_RECV_COPY_SEND_EXIT \
#  -DENABLE_NPKIT_EVENT_RECV_REDUCE_COPY_ENTRY -DENABLE_NPKIT_EVENT_RECV_REDUCE_COPY_EXIT \
#  -DENABLE_NPKIT_EVENT_RECV_REDUCE_COPY_SEND_ENTRY -DENABLE_NPKIT_EVENT_RECV_REDUCE_COPY_SEND_EXIT \
#  -DENABLE_NPKIT_EVENT_RECV_REDUCE_SEND_ENTRY -DENABLE_NPKIT_EVENT_RECV_REDUCE_SEND_EXIT \
#  -DENABLE_NPKIT_EVENT_SEND_ENTRY -DENABLE_NPKIT_EVENT_SEND_EXIT \
#  -DENABLE_NPKIT_EVENT_SEND_FROM_OUTPUT_ENTRY -DENABLE_NPKIT_EVENT_SEND_FROM_OUTPUT_EXIT \
#  -DENABLE_NPKIT_EVENT_PRIM_SIMPLE_WAIT_PEER_ENTRY -DENABLE_NPKIT_EVENT_PRIM_SIMPLE_WAIT_PEER_EXIT \
#  -DENABLE_NPKIT_EVENT_PRIM_SIMPLE_REDUCE_OR_COPY_MULTI_ENTRY -DENABLE_NPKIT_EVENT_PRIM_SIMPLE_REDUCE_OR_COPY_MULTI_EXIT \
#  -DENABLE_NPKIT_EVENT_PRIM_LL_WAIT_SEND_ENTRY -DENABLE_NPKIT_EVENT_PRIM_LL_WAIT_SEND_EXIT \
#  -DENABLE_NPKIT_EVENT_PRIM_LL_DATA_PROCESS_ENTRY -DENABLE_NPKIT_EVENT_PRIM_LL_DATA_PROCESS_EXIT \
#  -DENABLE_NPKIT_EVENT_PRIM_LL128_WAIT_SEND_ENTRY -DENABLE_NPKIT_EVENT_PRIM_LL128_WAIT_SEND_EXIT \
#  -DENABLE_NPKIT_EVENT_PRIM_LL128_DATA_PROCESS_ENTRY -DENABLE_NPKIT_EVENT_PRIM_LL128_DATA_PROCESS_EXIT \
#  -DENABLE_NPKIT_EVENT_NET_SEND_ENTRY -DENABLE_NPKIT_EVENT_NET_SEND_EXIT -DENABLE_NPKIT_EVENT_NET_RECV_ENTRY -DENABLE_NPKIT_EVENT_NET_RECV_EXIT"

# export NPKIT_FLAGS="-DENABLE_NPKIT -DENABLE_NPKIT_EVENT_TIME_SYNC_CPU -DENABLE_NPKIT_EVENT_TIME_SYNC_GPU -DENABLE_NPKIT_EVENT_ALL_REDUCE_RING_ENTRY -DENABLE_NPKIT_EVENT_ALL_REDUCE_RING_EXIT \
#     -DENABLE_NPKIT_EVENT_SEND_ENTRY -DENABLE_NPKIT_EVENT_SEND_EXIT \
#     -DENABLE_NPKIT_EVENT_RECV_ENTRY -DENABLE_NPKIT_EVENT_RECV_EXIT"

# make -j src.build CUDA_HOME=/apps/ault/spack/opt/spack/linux-centos8-zen/gcc-8.4.1/cuda-11.6.2-vk2v3pwiid3jg5ffedjh5evex6ezxg4p NVCC_GENCODE="-gencode=arch=compute_80,code=sm_80" NPKIT_FLAGS="$NPKIT_FLAGS"
# make -j src.build CUDA_HOME=/apps/ault/spack/opt/spack/linux-centos8-zen/gcc-8.4.1/cuda-12.1.1-zbdbt4aikrp6sdems6n3t5wvqxm3tza5 NVCC_GENCODE="-gencode=arch=compute_80,code=sm_80" NPKIT_FLAGS="$NPKIT_FLAGS"
make -j src.build CUDA_HOME=/apps/ault/spack/opt/spack/linux-centos8-zen/gcc-8.4.1/cuda-11.8.0-fjdnxm6yggxxp75sb62xrxxmeg4s24ml NVCC_GENCODE="-gencode=arch=compute_80,code=sm_80" NPKIT_FLAGS="$NPKIT_FLAGS"

# make -j src.build CUDA_HOME=/apps/ault/spack/opt/spack/linux-centos8-zen/gcc-8.4.1/cuda-12.1.1-zbdbt4aikrp6sdems6n3t5wvqxm3tza5 NVCC_GENCODE="-gencode=arch=compute_70,code=sm_70" NPKIT_FLAGS="$NPKIT_FLAGS"  ## NVIDIA V100 GPU
# make -j src.build CUDA_HOME=/apps/ault/spack/opt/spack/linux-centos8-zen/gcc-8.4.1/cuda-12.1.1-zbdbt4aikrp6sdems6n3t5wvqxm3tza5 NVCC_GENCODE="-gencode=arch=compute_86,code=sm_86" NPKIT_FLAGS="$NPKIT_FLAGS"