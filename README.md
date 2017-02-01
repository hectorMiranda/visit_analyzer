# Sense360 Code Challenge

The following program allows you to test a classifier function against some csv data.

## Getting Started
### Clone this repository

```
git clone https://github.com/hectorMiranda/visit_analyzer.git
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

3. Change permissions to make application file executable
```
chmod +x application.rb
```

## Application Design

I tried to keep this application as simple as possible, data is stored in a CSV format.

Given the nature of the problem I have decided to use a simple algorithm: k-means clustering.

The k-means clustering algorithm takes in, as input, a set of visits that represent points in the 2 dimensional plane. As output, visits will be grouped into k clusters. Unfortunately, the algorithm can't decide how many groups there are, so k is being set with a default value.

My original intention was to tweak the algorithm to exclude data that is older than 1 week and to update the total number of hours spent on each resulting cluster.

### Running the program

```
./visit_analyzer.rb user_01.txt 10

```
First argument represents a CSV file with visit data
Second argument represents the numbers of clusters that will be created

### TODO

* Define more datasets (CSV files) for testing: Having a dataset define would have been helpful to test the functionality of this application, putting together valid data takes a while.
* Validating the function with multiples datasets while verifying that only eligible visits are included in the resulting clusters
* While testing my input data I found some cases where the number of clusters define will cause an out of range exception if we don't have enough data to put on those clusters...
* I realize at a very late stage, that having to define the number of clusters in advance limits this implementation a lot, probably there is a better way to accomplish this implementation.
