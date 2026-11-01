import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.Iterator;
import java.util.Collections;
import java.util.TreeSet;
import java.util.Arrays;

/**
 * @author Josh
 *
 */
public class Thesaurus
{
	/**
     * Takes an input string and returns an ArrayList
     * containing each of the words in the input as a
     * separate element in the arraylist
     * 
     * @param input the string to be split up
     * @return an array with each item in the string as 
     *         an individual element
	 **/
    public static ArrayList splitString(String input)
    {
        ArrayList split = new ArrayList();
        // Create a stringtokenizer to read through the
        // input string one word at a time. Check out the
        // API if you have a question about this works.
        // Intuitively, it works like an iterator that just
        // iterates over whitespace separated words.
        StringTokenizer st = new StringTokenizer(input);
        while(st.hasMoreTokens()) {
            split.add(st.nextToken());
        }

        return split;
    }

	/**
     * Takes a input ArrayList and returns a string
     * containing each of the words in the ArrayList
     * delimited by a space
     * 
     * @param input the ArrayList to be stringified
     * @return a string containing each element from 
     *         the input delimited by a space
	 **/
    public static String makeString(ArrayList input)
    {
        String combinedString = "";

        Iterator iter = input.iterator();
        // iterate over the items in the arraylist
        while(iter.hasNext()) {
            // add each word to the string
            combinedString += (String)iter.next();
            // Only space separate if there are more
            // words to come. Alternately, you can think
            // of it as adding a space until you reach
            // the last word
            if(iter.hasNext()) combinedString += " ";
        }
        return combinedString;
    }

    /**
     * Returns whether the two strings can be combined
     * into a new one (if 2 words in the strings match)
     * 
     * @param one the first string to compare
     * @param two the other string ot compare
     * @return true if the strings can be combined, false
     *         otherwise
     **/
    public static boolean canCombine(String one, String two)
    {
        int total = 0;
 
        ArrayList first = splitString(one);
        ArrayList second = splitString(two);

        Iterator iter = first.iterator();
        // iterate over each item in the first arraylist
        while(iter.hasNext()) {
            String nextWord = (String)iter.next();
            // if the current word were looking at in the first
            // arraylist is in the second one, then we have found
            // a new word in common
            if(second.indexOf(nextWord) != -1)
                total++;
        }
        
        // only combine-able if the number of common words is 2 or more
        return (total >= 2);
    }

    /**
     * Actually combines two strings into a new one that
     * has entirely unique words. Used in conjunction with
     * the canCombine method
     * 
     * @param one the first string to compare
     * @param two the other string to compare
     * @return a new string that represents the combination
     *         of the two input strings
     **/
    public static String combine(String one, String two)
    {
        int total = 0;
 
        ArrayList first = splitString(one);
        ArrayList second = splitString(two);
        TreeSet combined = new TreeSet();

        // add everything to a treeset, so that every item
        // in the set is unique
        combined.addAll(first);
        combined.addAll(second);
        
        // put the new combined and unique element list back
        // into an arraylist so that makestring can be used
        ArrayList finalarray = new ArrayList(combined);
        return makeString(finalarray);
    }
    /**
     * Sorts the input arraylist by sorting each element,
     * which is assumed to be a string of words, and then
     * sorting all the strings, both in alphabetical order.
     *
     * @param entry the arrylist to be sorted
     * @return the sorted arraylist
     **/
    public static ArrayList sortAll(ArrayList entry)
    {
        ArrayList sorted = new ArrayList();
        Iterator iter = entry.iterator();

        // iterate over each item in the arraylist
        while(iter.hasNext()) {
        	// convert the string to an arraylist to sort it
        	// then convert back to string after its sorted
        	ArrayList temp = splitString((String)iter.next());
        	Collections.sort(temp);
            sorted.add(makeString(temp));
        }

        // now sort the actual strings of words
        Collections.sort(sorted);
        return sorted;
    }

    /**
     * Combines all of the elements from the input arraylist
     * and returns a new arraylist of the combined elements.
     *
     * @param entry the arraylist containing the strings of 
     *        words to be combined
     * @return the new combined arraylist
     */
    public static ArrayList combineAll(ArrayList entry)
    {
        int numcombined = 0;
        int i = 1;

        // workingList will be the arraylist of strings we
        // are starting with each time through the loop
        ArrayList workingList = entry;
        // combined is the arraylist of strings that is
        // local to the inner loop, and remembers what
        // combinations have been made
        ArrayList combined = new ArrayList();

        // This loop will execute until we are certain there
        // are no more items that are combine-able. Workinglist
        // is updated each time through the loop, and so will i.
        // i will be set to zero if a combination is found, and
        // will be incremented if no combination is found that
        // time through the loop. We know we are done if we
        // increment through the entire workinglist without
        // combining.
        while(i < workingList.size()) {
            numcombined = 0; // Reset this to 0 on every cycle

            // We now compare the first item in the list to
            // every other item in the list until we reach 
            // the end of the list. The reason this works is
            // because we are putting the first item on this
            // iteration at the end of the next iteration's list
            // if there are no combinations. Thus, we only need
            // to look at the first element of the list and
            // compare it to all the rest.
            String first = (String)workingList.get(0);
            for(int j = 1; j < workingList.size(); j++) {
                String second = (String)workingList.get(j);
                // See if the first item and the j'th item can
                // be combined.
                if(canCombine(first, second)) {
                    combined.add(combine(first, second));
                    // If they can, then combine them and add
                    // the combination to the updated list.
                    numcombined++;
                } else {
                    // If they can't, then add the item you are
                    // comparing the first item to. We can't add
                    // the first item because we don't know if it
                    // will combine with any other items.
                    combined.add(second);
                }
            }
            // If no combinations occured on this iteration of the
            // loop, then add the first element to the end of the
            // new list and increment i, which represents how many
            // times we've cycled through a given array without
            // any combinations occuring.
            if(numcombined == 0) {
                combined.add(first);
                i++;
            } else {
                // If a combination occured, then don't add the first
                // element back, but reset i to zero since we are
                // going to be cycling through a new list.
                i = 0;
            }

            // Update the workingList with what we have discovered
            // on this iteration through the loop.
            workingList.clear();
            workingList.addAll(combined);
            combined.clear();
        }

        return workingList;
    }

    /**
     * This is basically a wrapper around combineAll. It converts
     * the input into easier to deal with ArrayLists and calls
     * combineAll, then sorts the combined strings, then returns
     * an array of the combined strings.
     * 
     * @param entry the string array of strings of words to be
     *        combined
     * @return a new string array of alphabetized and combined
     *         strings of words
     **/
    public static String[] edit(String[] entry)
    {
    	ArrayList entryList = new ArrayList(Arrays.asList(entry));
        entryList = combineAll(entryList);
        entryList = sortAll(entryList);

        // convert the objects recieved from arraylist.get into
        // strings so that a string[] can be returned
        String [] returnarray = new String [entryList.size()];
        for(int i = 0; i < returnarray.length; i++) {
            returnarray[i] = (String)entryList.get(i);
        }
        
        return returnarray;
    }
 
    /**
     * A simple helper function to allow for ArrayList style
     * printing of array elements
     *
     * @param myarray array of strings to print
     **/
    public static void print(String[] myarray)
    {
        for(int i = 0; i < myarray.length; i++) {
            System.out.print("["+myarray[i]+"] ");
        }
        System.out.print("\n");
    }
    
    public static void main(String args[])
    {
       
    
        String[] entry = {"a m w", "w t s", "m t f s"};

        System.out.println("Before combining:");
        print(entry);

        System.out.println("\nAfter combining:");
        String[] output = edit(entry);
        
        print(output);
    }
}