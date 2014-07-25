using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aphelion.DW.StagingCreate
{
    public static class Extensions
    {
        public static string Replace(this string str, string oldValue, string newValue, StringComparison comparison)
        {
            if (oldValue == "")
            {
                return str;
            }
            StringBuilder sb = new StringBuilder();

            int previousIndex = 0;
            int index = str.IndexOf(oldValue, comparison);
            while (index != -1)
            {
                sb.Append(str.Substring(previousIndex, index - previousIndex));
                sb.Append(newValue);
                index += oldValue.Length;

                previousIndex = index;
                index = str.IndexOf(oldValue, index, comparison);
            }
            sb.Append(str.Substring(previousIndex));

            return sb.ToString();
        }

        public static long HashFNV1a_64_ABS(string value)
        {
            ulong offset64 = 0xcbf29ce484222325;
            ulong prime64 = 1099511628211;
            ulong hash = offset64;

            byte[] bytes = Encoding.UTF8.GetBytes(value.ToLower());

            for (int i = 0; i < bytes.Length; i++)
            {
                hash = (hash ^ bytes[i]) * prime64;
            }
            return Math.Abs((long)(hash - long.MaxValue));

        }
    
    }

    
}
