SRCDIR := src
BINDIR := bin

SRCS := $(wildcard $(SRCDIR)/*.s)
OBJS := $(patsubst $(SRCDIR)/%.s, $(BINDIR)/%.o, $(SRCS))

TARGET := libft.a

all: $(TARGET)

clean:
	@echo "Cleaning object files"
	@rm -rf $(BINDIR)

fclean: clean
	@echo "Cleaning binary"
	@rm -f $(TARGET)

re: fclean all

compile:
	gcc test.c libft.a -o test

$(TARGET): $(OBJS)
	@echo "ar rc $@"
	@ar rc $@ $^

$(OBJS): $(BINDIR)/%.o: $(SRCDIR)/%.s
	@mkdir -p $(shell dirname $@)
	@echo "AS $<"
	nasm -f macho64 -o $@ $<

.PHONY: all clean fclean