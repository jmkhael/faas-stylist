FROM tensorflow/magenta

ADD patch.sh .
ADD varied.sh .
ADD monet.sh .

RUN sh patch.sh

ADD input input
CMD ["sh", "varied.sh", "input/content.jpg", "1"]
