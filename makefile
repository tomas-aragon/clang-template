CC=clang
CFLAGS=-g -Wall

SRCDIR=src
OBJDIR=obj
BINDIR=bin
SRCS=$(wildcard $(SRCDIR)/*.c)
OBJS=$(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRCS))
BIN= $(BINDIR)/out

all: $(BIN)

release: CFLAGS=-Wall -02 -DNDEBUG
release: clean
release: $(BIN)


$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(BINDIR)/* $(OBJDIR)/*
