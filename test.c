#include <stdio.h>

extern void ft_bzero(void *s, size_t n);
extern unsigned ft_strlen(const char *str);
extern char *ft_strcat(char *restrict s1, const char *restrict s2);
extern int ft_isalpha(int c);

void hexDump (char *desc, void *addr, int len) {
    int i;
    unsigned char buff[17];
    unsigned char *pc = (unsigned char*)addr;

    // Output description if given.
    if (desc != NULL)
        printf ("%s:\n", desc);

    if (len == 0) {
        printf("  ZERO LENGTH\n");
        return;
    }
    if (len < 0) {
        printf("  NEGATIVE LENGTH: %i\n",len);
        return;
    }

    // Process every byte in the data.
    for (i = 0; i < len; i++) {
        // Multiple of 16 means new line (with line offset).

        if ((i % 16) == 0) {
            // Just don't print ASCII for the zeroth line.
            if (i != 0)
                printf ("  %s\n", buff);

            // Output the offset.
            printf ("  %04x ", i);
        }

        // Now the hex code for the specific character.
        printf (" %02x", pc[i]);

        // And store a printable ASCII character for later.
        if ((pc[i] < 0x20) || (pc[i] > 0x7e))
            buff[i % 16] = '.';
        else
            buff[i % 16] = pc[i];
        buff[(i % 16) + 1] = '\0';
    }

    // Pad out last line if not exactly 16 characters.
    while ((i % 16) != 0) {
        printf ("   ");
        i++;
    }

    // And print the final ASCII bit.
    printf ("  %s\n", buff);
}

int main(void)
{
	char hello[6] = "hello\0"; // *hello would be not readable
	printf("%s\n", hello);
	printf("%d\n", ft_strlen(hello)); // test ft_strlen
	ft_bzero(hello, 6);			// test bzero
	printf("%s\n", hello);
    hexDump ("hello", hello, sizeof (hello));

    //FAILS BADLY
    // char copyone[4] = "bat\0";
    // char copytwo[4] = "man\0";
    // char *retcopy;

    // retcopy = ft_strcat(copyone, copytwo);

    //printf("%s", retcopy);
    //FAILS ABOVE

    char alpha = 'Z';

    printf("%c%d", alpha, ft_isalpha(alpha));

}