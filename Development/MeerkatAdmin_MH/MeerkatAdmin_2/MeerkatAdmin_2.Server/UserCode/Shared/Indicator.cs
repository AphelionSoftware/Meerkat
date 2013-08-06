namespace LightSwitchApplication
{
    public partial class Indicator
    {
        partial void Indicator_Created()
        {
            this.ActiveType = DataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(1);
            
        }
    }
}
