# Sense360 Code Challenge

The following program allows you to test a classifier function against some predefined data.

The program allows you to read different files, representing data for a given user.

## Getting Started
### Clone this repository

```

```

### Set up RVM and create a gemset

Follow this instructions to set up your initial development environment.

1. Install RVM
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
```
2. Install 2.3.1 as the default
```
rmv install 2.3.1
```
3. Create sense360 gemset and use this 2.3.1 as default
```
rvm use 2.3.1@sense360 --create
```

4. Change permissions to make application file executable
```
chmod +x application.rb
```

## Application Design

I tried to keep this application as simple as possible, data is stored in a CSV format.

Given the nature of the problem I have decided to use a simple algorithm: k-means clustering.

K-means a simple unsupervised machine learning algorithm that groups a dataset into a user specified number (k) of clusters.

The k-means clustering algorithm takes in, as input, a set of visits that represent points in the 2 dimensional plane. As output, visits will be grouped into k clusters. Unfortunately, the algorithm can't decide how many groups there are, so k is being set with a default value.

I have tweak the algorithm to exclude data that is older than 1 week and to update the total number of hours spent on each resulting cluster

### Running the program

```
./visit_analyzer.rb
```
