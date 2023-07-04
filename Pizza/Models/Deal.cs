using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Pizza.Models.Enitities
{
    public class Deal
    {
        public int  DealID { get; set; }
        public string DealName { get; set; }
        public string DealDesc { get; set; }
        public string DealImage { get; set; }
        public decimal DealPrice { get; set; }


        public List<Deal> getAllDeals()
        {
            Connection.dbconnect();
            List<Deal> dealList = new List<Deal>();
            SqlCommand cmd = new SqlCommand("sp_getAllDeals", Connection.conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                Deal deal = new Deal();
                deal.DealID = (int)sdr[0];
                deal.DealName = sdr["DealName"].ToString();
                deal.DealDesc = sdr["DealDesc"].ToString();
                deal.DealImage = sdr["DealImage"].ToString();
                deal.DealPrice = (decimal)sdr["DealPrice"];
                dealList.Add(deal);

            } sdr.Close();
            Connection.CloseConn();

            return dealList;

        }

        //public List<Deal> getSpecialDeals()
        //{
        //    Connection.dbconnect();
        //    List<Deal> dealList = new List<Deal>();
        //    SqlCommand cmd = new SqlCommand("sp_getSpecialDeals", Connection.conn);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    SqlDataReader sdr = cmd.ExecuteReader();

        //    while (sdr.Read())
        //    {
        //        Deal sDeal = new Deal();
        //        sDeal.DealID = (int)sdr[0];
        //        sDeal.DealName = sdr["DealName"].ToString();
        //        sDeal.DealDesc = sdr["DealDesc"].ToString();
        //        sDeal.DealImage = sdr["DealImage"].ToString();
        //        sDeal.DealPrice = (decimal)sdr["DealPrice"];
        //        dealList.Add(sDeal);
        //    } sdr.Close();
        //    Connection.CloseConn();
        //    return dealList;

        //}


        public List<Deal> getSpecialDeals()
        {
            List<Deal> dealList = new List<Deal>();
            Connection.dbconnect();

            var datatable = new Connection().getData("sp_getSpecialDeals", true);

            if (datatable.Rows.Count < 0)
            {
                return null;
            }

            for (int i = 0; i < datatable.Rows.Count; i++)
            {
                Deal sDeal = new Deal();
                sDeal.DealID    = (int)datatable.Rows[i]["DealID"];
                sDeal.DealName  = (string)datatable.Rows[i]["DealName"];
                sDeal.DealDesc  = (string)datatable.Rows[i]["DealDesc"];
                sDeal.DealImage = (datatable.Rows[i]["DealImage"] == DBNull.Value ) ? null : (string)datatable.Rows[i]["DealImage"];
                sDeal.DealPrice = (decimal)datatable.Rows[i]["DealPrice"];
                dealList.Add(sDeal);
            }

            
            Connection.CloseConn();
            return dealList;

        }
    
        //public Deal get_deal_by_id(int id)
        //{
        //    Connection.dbconnect();
        //    SqlCommand cmd = new SqlCommand("sp_getDealByID", Connection.conn);
        //    cmd.CommandType = CommandType.StoredProcedure;


        //    cmd.Parameters.AddWithValue("@id", id);
        //    SqlDataReader sdr = cmd.ExecuteReader();
        //    Deal deal = new Deal();

        //    while (sdr.Read())
        //    {
        //        deal.DealID = (int)sdr[0];
        //        deal.DealName = sdr["DealName"].ToString();
        //        deal.DealDesc = sdr["DealDesc"].ToString();
        //        deal.DealPrice = (decimal)sdr["DealPrice"];
        //        deal.DealImage = sdr["DealImage"].ToString();

        //    } sdr.Close();
        //    Connection.CloseConn();

        //    return deal;
        //}

        public Deal get_deal_by_id(int id)
        {
            Deal deal = new Deal();
            Connection.dbconnect();

            Dictionary<String, Object> param = new Dictionary<string,object>();

            param.Add("@id",id);
            var datatable = new Connection().getData("sp_getDealByID", true, param);


            if (datatable.Rows.Count < 0)
            {
                return null;
            }

            for (int i = 0; i < datatable.Rows.Count; i++)
            {
                deal.DealID = (int)datatable.Rows[i]["DealID"];
                deal.DealName  = (string)datatable.Rows[i]["DealName"];
                deal.DealDesc  = (string)datatable.Rows[i]["DealDesc"];
                deal.DealImage =  datatable.Rows[i]["DealImage"] == DBNull.Value  ? null : (string) datatable.Rows[i]["DealImage"];
                deal.DealPrice = (decimal)datatable.Rows[i]["DealPrice"];
            }


            Connection.CloseConn();
            return deal;
        }

    
    }
}