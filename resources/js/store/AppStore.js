import { create } from 'zustand'

const useStore = create((set,get) => ({
    basket: [],
    quantity: 0,
    paymentMethod: [],
    acount:{},
    contact :{},
    voucherDiskon:{},
  
    storeProduct: (product) => set((state) => ({ quantity: 1, basket: [product] })),
    increasQuantity: () => set((state) => ({ quantity: state.quantity + 1 })),
    decreasQuantity: () => set((state) => ({ quantity: Math.max(1, state.quantity - 1) })), // Hindari nilai negatif
    addPaymentMethod: (value) => set((state) => ({ paymentMethod: [value] })),
    setAcount: (newData) => set({ acount: newData }),
    setVoucherDiskon : (newData) => set({ voucherDiskon: newData }),
    setContact:(newData) => set({ contact: newData }),
    clean: () => set({ basket: [], quantity: 0, biaya: 0,paymentMethod:[] }), // Mengosongkan semua state
    getAll: () => {
        const state = get();
        return Object.keys(state)
            .filter((key) => typeof state[key] !== 'function') // Hanya ambil yang bukan function
            .reduce((obj, key) => {
                obj[key] = state[key];
                return obj;
            }, {});
    }
}))

export default useStore
