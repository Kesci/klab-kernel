# PyTorch
import torch
import torch.nn as tnn
import torch.autograd as autograd
torch.manual_seed(31337)
linear_torch = tnn.Linear(5,3)
data_torch = autograd.Variable(torch.randn(2, 5))
print(linear_torch(data_torch))
print("PyTorch ok")

from allennlp.models import Model
print("allennnlp ok")
