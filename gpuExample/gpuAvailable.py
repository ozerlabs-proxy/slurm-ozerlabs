import tensorflow as tf


print("tfVersion: ", tf.__version__)

gpu_available = tf.test.is_gpu_available()
print("gpu_available: ",gpu_available)

is_cuda_gpu_available = tf.test.is_gpu_available(cuda_only=True)
print("is_cuda_gpu_available: ", is_cuda_gpu_available)

gpus = tf.config.experimental.list_physical_devices('GPU')
print("gpus: ",gpus)

is_cuda_gpu_min_3 = tf.test.is_gpu_available(True, (3,0))
print("is_cuda_gpu_min_3: ",is_cuda_gpu_min_3)

