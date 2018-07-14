SRCDIR := src
BINDIR := bin

SRCS := $(wildcard $(SRCDIR)/*.S)
OBJS := $(patsubst $(SRCDIR)/%.S, $(BINDIR)/%.o, $(SRCS))

TARGET := libft.a

all: $(TARGET)

clean:
	@echo "Cleaning object files"
	@rm -rf $(BINDIR)

fclean: clean
	@echo "Cleaning binary"
	@rm -f $(TARGET)

re: fclean all

$(TARGET): $(OBJS)
	@echo "LD $@"
	@ld -pie -o $@ $^

$(OBJS): $(BINDIR)/%.o: $(SRCDIR)/%.S
	@mkdir -p $(shell dirname $@)
	@echo "AS $<"
	@nasm -f macho64 -o $@ $<

.PHONY: all clean fclean