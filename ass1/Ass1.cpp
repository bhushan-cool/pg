#include <iostream>
#include <cstring>
using namespace std;

void caesar_encrypt(char src[100], int key, int dist)
{
    for (int i=0; i < dist; i++)
    {
        if (src[i] >= 'A' && src[i] <= 'Z')
        {
            src[i] = (char)(((src[i] + key)));
        }
        else if (src[i] >= 'a' && src[i] <= 'z')
        {
            src[i] = (char)(((src[i] + key)));
        }
    }
}

void caesar_decrypt(char src[100], int key, int dist)
{
    for (int i=0; i < dist; i++)
    {
        if (src[i] >= 'A' && src[i] <= 'Z')
        {
            src[i] = (char)(((src[i] - key - 'A' + 26) % 26) + 'A');
        }
        else if (src[i] >= 'a' && src[i] <= 'z')
        {
            src[i] = (char)(((src[i] - key - 'a' + 26) % 26) + 'a');
        }
    }
}

main ()
{
    char caesar[10];
    static const char encrypt[] = "e";
    static const char decrypt[] = "d";
    int key;
    char src[100];
    int result1;
    int result2;
    int dist;



    cout << "Enter operation: encrypt or decrypt" << endl;
    cin >> caesar;

    cout << "Enter key" << endl;
    cin >> key;

    cout << "Enter text to encrypt/decrypt" << endl;
    cin >> src;


    dist = strlen (src);

    result1 = strcmp (caesar, encrypt);
    result2 = strcmp (caesar, decrypt);

    if(result1 == 0)
    {
        caesar_encrypt(src, key, dist);
    }
    if(result2 == 0)
    {
        caesar_decrypt(src, key, dist);
    }

    cout << "Result:" << endl;
    cout << src << endl;
}
