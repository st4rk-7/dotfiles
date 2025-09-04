CXX = g++
CXXFLAGS = -std=c++17 -Ofast -Iinclude
LDFLAGS = -lX11

SRCDIR := src
INCDIR := include
BUILDDIR := build
TARGET := fetch

SRCS := $(wildcard $(SRCDIR)/*.cpp)
OBJS := $(patsubst $(SRCDIR)/%.cpp, $(BUILDDIR)/%.o, $(SRCS))
DEPS := $(OBJS:.o=.d)

PREFIX := /usr/local
BINDIR := $(PREFIX)/bin

.PHONY: all build clean install uninstall

all: build

build: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $@ $(LDFLAGS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -MMD -MP -c $< -o $@

-include $(DEPS)

clean:
	rm -rf $(BUILDDIR) $(TARGET)

install: $(TARGET)
	install -Dm755 $(TARGET) $(BINDIR)/$(TARGET)

uninstall:
	rm -f $(BINDIR)/$(TARGET)
