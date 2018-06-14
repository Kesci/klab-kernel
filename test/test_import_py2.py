import paddle.v2.dataset.uci_housing as uci_housing
import paddle.v2 as paddle
paddle.init(use_gpu=True, trainer_count=1)
x = paddle.layer.data(name='xx', type=paddle.data_type.dense_vector(13))
y_predict = paddle.layer.fc(input=x,
                                size=1,
                                act=paddle.activation.Linear())
y = paddle.layer.data(name='yy', type=paddle.data_type.dense_vector(1))
cost = paddle.layer.square_error_cost(input=y_predict, label=y)
parameters = paddle.parameters.create(cost)
optimizer = paddle.optimizer.Momentum(momentum=0)
trainer = paddle.trainer.SGD(cost=cost,
                             parameters=parameters,
                             update_equation=optimizer)
feeding={'xx': 0, 'yy': 1}

trainer.train(
    reader=paddle.batch(
        paddle.reader.shuffle(
            uci_housing.train(), buf_size=500),
        batch_size=2),
    feeding=feeding,
    num_passes=30)
test_data_creator = uci_housing.test()
test_data = []
test_label = []
for item in test_data_creator():
    test_data.append((item[0],))
    test_label.append(item[1])
    if len(test_data) == 5:
        break

probs = paddle.infer(
    output_layer=y_predict, parameters=parameters, input=test_data)

for i in xrange(len(probs)):
    print "label=" + str(test_label[i][0]) + ", predict=" + str(probs[i][0])

# networkx
import networkx as nx
print("networkx ok")

# Tensorflow
import tensorflow as tf
print(tf.__version__)
hello = tf.constant('TensorFlow ok')
sess = tf.Session()
print(sess.run(hello))

import gensim
print("gensim ok")
