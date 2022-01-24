class outer
{
 outer(int n[])
 {
	nums =n;
 }
 void anlyze()
 {
	inner inob= new inner();
	
	System.out.println("minimum: "+inob.min());
	System.out.println("minimum: "+inob.max());
	System.out.println("minimum: "+inob.avg());
 }
 class inner()
 {
	void min()
	{
	}
	void max()
	{
	}
	void avg()
	{
	}

 }