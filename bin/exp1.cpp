#include<iostream>
#include<string.h>
#include<fstream>
using namespace std;
class binary
{
	int i,j,k,n;
	int acc_no[60],acc_bal[60],key;
	char name[60][60],add[60][60];
   public:
	void accept();
	void sort();
	void binary_search();
};
void binary::accept()
{
  n=0;
  fstream f;
  int tacc_no,tacc_bal;
  char tname[60],tadd[60];
  f.open("abc.txt");
  if(!f)
  {
   cout<<"\nFile not opened...";
  }
  else
  {
    while(!f.eof())
    {
	f>>tacc_no;
	acc_no[n]=tacc_no;
	f>>tname;
	strcpy(name[n],tname);
	f>>tadd;
	strcpy(add[n],tadd);
	f>>tacc_bal;
	acc_bal[n]=tacc_bal;
        n++;
    }
  }
  f.close();
  n--;
   //for(i=0;i<n;i++)
	// cout<<"\n"<<acc_no[i]<<"\t"<<name[i]<<"\t"<<add[i]<<"\t"<<acc_bal[i];
}

void binary::sort()
{
	int flag=0,tno,tbal;
    	char tname[60],tadd[60];
	for(i=0;i<n-1;i++)
	{
		if(acc_no[i]>acc_no[i+1])
			flag=1;
	}
        if(flag==0)
		cout<<"\nData is already sorted\n\n";
	else
	{
		cout<<"\nSorting data.......\n\n";
		for(i=0;i<n;i++)
		{
			for(j=0;j<n-1-i;j++)
			{
				if(acc_no[j]>acc_no[j+1])
				{
					tno=acc_no[j];
					strcpy(tname,name[j]);
					strcpy(tadd,add[j]);
					tbal=acc_bal[j];

					acc_no[j]=acc_no[j+1];
					strcpy(name[j],name[j+1]);
					strcpy(add[j],add[j+1]);
					acc_bal[j]=acc_bal[j+1];

					acc_no[j+1]=tno;
					strcpy(name[j+1],tname);
					strcpy(add[j+1],tadd);
					acc_bal[j+1]=tbal;
				}
			}
		}
	}
	//cout<<"\nAccount Numbers are:\n";
	//for(i=0;i<n;i++)
	// cout<<"\t"<<acc_no[i];
}


void binary::binary_search()
{
  int ch,low,mid,high;
 do{
	cout<<"\nEnter key(account number) to search record:";
	cin>>key;
	low=0;
	high=n-1;
        if((key<acc_no[0]) || (key>acc_no[n-1]))
	{
		cout<<"\nNo Data Found...!!!";
	}
        else
	{
	 while(low<=high)
	 {
		mid=(low+high)/2;
		if(key==acc_no[mid])
		{
			cout<<"\nData found is .....\n";
			cout<<"Account Number: "<<acc_no[mid];
			cout<<"\nName: "<<name[mid];
			cout<<"\nAddress: "<<add[mid];
			cout<<"\nAccount Balance: "<<acc_bal[mid];
			break;
		}
		else if(key<acc_no[mid])
		{
			if(low==high)
			{
				cout<<"\nNo Data found...!!!";
				break;
			}
			else
				high=mid-1;
		}
		else 
		{
			if(low==high)
			{
				cout<<"\nNo Data found...!!!";
				break;
			}
			else
				low=mid+1;
		}
 	 }
	}
	cout<<"\nDo you want to search any other record(0/1):";
	cin>>ch;
  }while(ch==1);
}
int main()
{
  binary b;
  b.accept();
  b.sort();
  b.binary_search();
  return 0;
}
