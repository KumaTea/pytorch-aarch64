# Note: this code is only used for benchmarking.
#       Using ResNet34 for MNIST is a waste of resources.


import time
import random
from fastai.vision.all import *


path = untar_data(URLs.MNIST_TINY)

def is_t(x):
    return '3/' in x or '3\\' in x


def bench_train(test_times):
    time_costs = []

    # get_image_files(path, recurse=True, folders='train')

    for i in range(test_times):
        dls = ImageDataLoaders.from_name_func(
            path, random.choices(get_image_files(path, recurse=True, folders='train'), k=256),
            valid_pct=0.2, seed=42,
            label_func=is_t, item_tfms=Resize(224), bs=16)

        learn = cnn_learner(dls, resnet34, metrics=error_rate)

        t0 = time.time()
        learn.fine_tune(1)
        t1 = time.time()

        time_costs.append(t1 - t0)

    fixed_cost = time_costs.copy()
    fixed_cost.remove(max(fixed_cost))
    fixed_cost.remove(min(fixed_cost))
    final_cost = sum(fixed_cost)/len(fixed_cost)

    return final_cost, learn


def bench_predict(test_times, learn):
    predict_images = random.choices(get_image_files(path, recurse=True, folders='train'), k=test_times)
    time_costs = []

    for i in predict_images:
        with PILImage.create(i) as img:
            t0 = time.time()
            learn.predict(img)
            t1 = time.time()

            time_costs.append(t1 - t0)

    fixed_cost = time_costs.copy()
    fixed_cost.remove(max(fixed_cost))
    fixed_cost.remove(min(fixed_cost))
    final_cost = sum(fixed_cost) / len(fixed_cost)

    return final_cost


if __name__ == '__main__':
    train_cost, lrn = bench_train(int(input('How many times to run the train test? ')))
    print(f'Train cost: {train_cost}')
    predict_cost = bench_predict(int(input('How many times to run the predict test? ')), lrn)
    print(f'Predict cost: {predict_cost}')
