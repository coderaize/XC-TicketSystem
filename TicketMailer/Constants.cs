using System;
using System.Linq;
using System.Text.RegularExpressions;

namespace TicketMailer
{
    
    public class Constants
    {

        public static string GetFirstRegexMatch(string pattern, string text)
        {
            if (Regex.IsMatch(text, pattern))
                return Regex.Matches(text, pattern, RegexOptions.IgnoreCase)[0].Value ?? null;
            else return "";
        }

        public static bool MatchRegex(string pattern, string text)
        {
            return Regex.IsMatch(text, pattern);
        }

        private static readonly Random random = new Random();
        public static string GetRandomString(int Length = 10)
        {
            return new string(Enumerable.Repeat("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", Length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

    }
}